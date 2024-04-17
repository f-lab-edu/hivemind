//
//  File.swift
//  
//
//  Created by 유준용 on 4/8/24.
//

public protocol SocialAuthenticatable: AnyObject {
    func startSignInFlow()
}

public protocol SocialSignInDelegate: AnyObject {
    func didCompleteSignIn(error: Error?)
}

public protocol SignInPresentationContextProviding: AnyObject {
    func presentationAnchor() -> Any
}
