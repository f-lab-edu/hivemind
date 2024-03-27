//
//  File.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import Foundation
import CryptoKit
import AuthenticationServices
import FirebaseAuth

//final class AuthenticationUsecaseImpl: NSObject {
//    
//    fileprivate var currentNonce: String?
//
//    func startSignInWithAppleFlow() {
//      let nonce = randomNonceString()
//      currentNonce = nonce
//      let appleIDProvider = ASAuthorizationAppleIDProvider()
//      let request = appleIDProvider.createRequest()
//      request.requestedScopes = [.fullName, .email]
//      request.nonce = sha256(nonce)
//
//      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//      authorizationController.delegate = self
//      authorizationController.presentationContextProvider = self
//      authorizationController.performRequests()
//    }
//    
//    private func sha256(_ input: String) -> String {
//      let inputData = Data(input.utf8)
//      let hashedData = SHA256.hash(data: inputData)
//      let hashString = hashedData.compactMap {
//        String(format: "%02x", $0)
//      }.joined()
//
//      return hashString
//    }
//    
//    private func randomNonceString(length: Int = 32) -> String {
//        precondition(length > 0)
//        var randomBytes = [UInt8](repeating: 0, count: length)
//        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
//        if errorCode != errSecSuccess {
//            fatalError(
//                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
//            )
//        }
//        
//        let charset: [Character] =
//        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
//        
//        let nonce = randomBytes.map { byte in
//            // Pick a random character from the set, wrapping around if needed.
//            charset[Int(byte) % charset.count]
//        }
//        
//        return String(nonce)
//    }
//}
