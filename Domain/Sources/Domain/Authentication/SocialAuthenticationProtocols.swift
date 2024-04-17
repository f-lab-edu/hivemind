//
//  File.swift
//  
//
//  Created by 유준용 on 4/8/24.
//

struct SocialLoginCredential

public protocol SocialAuthenticatable: AnyObject {
  func startSignInFlow() async throws -> SocialLoginCredential
}

public protocol SocialSignInDelegate: AnyObject {
    func didCompleteSignIn(error: Error?)
}

public protocol SignInPresentationContextProviding: AnyObject {
    func presentationAnchor() -> Any
}


public class AppleLogin: SocialAuthenticatable {
  
  private let appleLoginRepository: AppleLoginRepository
  private let firebaseRepo: RemoteAuthRepository
  
  public func startSignInFlow() {
    let credential = self.appleLoginRepository.signIn()
    self.firebaseRepo.login(credential)
  }
  
}

// Repository
public protocol AppleLoginRepository {
  
}

public protocol RemoteAuthRepository {
  func login(crendential)
}

