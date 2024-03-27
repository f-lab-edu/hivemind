//
//  LoginViewController.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import RxSwift
import UIKit

import SnapKit
import CryptoKit
import AuthenticationServices
import FirebaseAuth

protocol LoginPresentableListener: AnyObject {
    func requestLogin()
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {

    //MARK: - Properties
    
    fileprivate var currentNonce: String?

    weak var listener: LoginPresentableListener?
    
    //MARK: - UI Components
    
    private lazy var appleLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Apple Login", for: .normal)
        return btn
    }()
    
    private func configureUI(){
        self.view.addSubview(self.self.appleLoginButton)
        self.appleLoginButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        self.appleLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startSignInWithAppleFlow)))
        
    }
    
    //MARK: - View LifeCycle
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(true)
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
     func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error.
      print("Sign in with Apple errored: \(error)")
    }
    
    
    @objc func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
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
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
}
