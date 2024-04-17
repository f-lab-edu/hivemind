//
//  File.swift
//
//
//  Created by 유준용 on 4/8/24.
//

import CryptoKit
import AuthenticationServices
import FirebaseAuth

import Domain

public class AppleSignInService: NSObject, SocialAuthenticatable {
    
    private var currentNonce: String?
    public weak var delegate: SocialSignInDelegate?
    weak var presentationContextProvider: SignInPresentationContextProviding?
    
    public func startSignInFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = presentationContextProvider?.presentationAnchor() as? ASAuthorizationControllerPresentationContextProviding
        authorizationController.performRequests()
//        UserDefaults.standard.setValue(true, forKey: "didLogin")
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

extension AppleSignInService: ASAuthorizationControllerDelegate {
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let nonce = currentNonce,
              let appleIDToken = appleIDCredential.identityToken,
              let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            delegate?.didCompleteSignIn(error: NSError(domain: "AppleLogin", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials or state"]))
            return
        }

        let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                       rawNonce: nonce,
                                                       fullName: appleIDCredential.fullName
        )
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                self.delegate?.didCompleteSignIn(error: error)
            } else {
                self.delegate?.didCompleteSignIn(error: nil)
            }
        }
    }

    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        delegate?.didCompleteSignIn(error: error)
    }
}


//extension AppleLoginService: ASAuthorizationControllerDelegate{
//    
//    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//      if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//        guard let nonce = currentNonce else {
//          fatalError("Invalid state: A login callback was received, but no login request was sent.")
//        }
//        guard let appleIDToken = appleIDCredential.identityToken else {
//          print("Unable to fetch identity token")
//          return
//        }
//        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//          return
//        }
//        let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
//                                                          rawNonce: nonce,
//                                                          fullName: appleIDCredential.fullName)
//        // Sign in with Firebase.
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//          if error != nil{
//            // Error. If error.code == .MissingOrInvalidNonce, make sure
//            // you're sending the SHA256-hashed nonce as a hex string with
//            // your request to Apple.
//              print(error?.localizedDescription)
//            return
//          }
//          // User is signed in to Firebase with Apple.
//          // ...
//            print(authResult)
//        }
//      }
//    }
//
//    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//      // Handle error.
//      print("Sign in with Apple errored: \(error)")
//    }
//  }
