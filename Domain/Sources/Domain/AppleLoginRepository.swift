//
//  File.swift
//  
//
//  Created by 유준용 on 4/8/24.
//

public protocol AppleLoginServiceProtocol: AnyObject {
    func startSignInWithAppleFlow()
}

public protocol AppleLoginDelegate: AnyObject {
    func didCompleteSignInWithApple(error: Error?)
}

public protocol AppleLoginPresentationContextProvider: AnyObject {
    func presentationAnchor() -> Any
}
