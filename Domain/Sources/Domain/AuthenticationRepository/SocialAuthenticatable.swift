//
//  File.swift
//
//
//  Created by 유준용 on 4/8/24.
//

public protocol SocialAuthenticatable: AnyObject {
    func signInWithAppleFlow() async throws
}

public class SocialAuthenticator: SocialAuthenticatable {
    
    private let appleLoginRepository: AppleLoginRepository
    private let firebaseRepo: RemoteAuthRepository
    
    public init(
        appleLoginRepository: AppleLoginRepository,
        firebaseRepo: RemoteAuthRepository
    ) {
        self.appleLoginRepository = appleLoginRepository
        self.firebaseRepo = firebaseRepo
    }
    
    public func signInWithAppleFlow() async throws {
        let credential = try await self.appleLoginRepository.signIn()
        try await self.firebaseRepo.login(credential: credential)
    }

}
