//
//  File.swift
//
//
//  Created by 유준용 on 4/8/24.
//

import CryptoKit
import AuthenticationServices
import Domain

public class AppleSignInRepositoryImpl: NSObject, AppleLoginRepository {
    
    private var continuation: CheckedContinuation<SocialLoginCredential, Error>?
    private var currentNonce: String?
    
    public override init() { }
    
    public func signIn() async throws -> SocialLoginCredential {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        do {
            return try await withCheckedThrowingContinuation { continuation in
                self.continuation = continuation
            }
        }
        catch {
            throw NSError(domain: "com.yourapp.error", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Failed to start Apple Sign In process."])

        }
    }
    
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
}

extension AppleSignInRepositoryImpl: ASAuthorizationControllerDelegate {
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let nonce = currentNonce,
              let appleIDToken = appleIDCredential.identityToken,
              let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            continuation?.resume(throwing: NSError(domain: "Invalid Credentials", code: 0))
            return
        }
        
        let credential = SocialLoginCredential(
            idToken: idTokenString,
            rawNonce: nonce,
            fullName: appleIDCredential.fullName
        )

        continuation?.resume(returning: credential)
    }

    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        continuation?.resume(throwing: error)
    }
}
