//
//  File.swift
//  
//
//  Created by 유준용 on 4/22/24.
//

import XCTest
@testable import Domain

final class SocialAuthenticatorTests: XCTestCase {
    var sut: SocialAuthenticator!
    var mockAppleLoginRepository: MockAppleLoginRepository!
    var mockFirebaseAuthRepository: MockFirebaseAuthRepository!

    override func setUp() {
        super.setUp()
        mockAppleLoginRepository = MockAppleLoginRepository()
        mockFirebaseAuthRepository = MockFirebaseAuthRepository()
        sut = SocialAuthenticator(
            appleLoginRepository: mockAppleLoginRepository,
            firebaseRepo: mockFirebaseAuthRepository
        )
    }
    
    func testSignInWithAppleFlow_Success() {
        mockAppleLoginRepository.shouldSucceed = true
        mockAppleLoginRepository.signInResult = SocialLoginCredential(
            idToken: "validToken",
            rawNonce: "nonce",
            fullName: nil
        ) 
        mockFirebaseAuthRepository.shouldSucceed = true
        
        Task {
            do {
                try await sut.signInWithAppleFlow()
            } catch {
                XCTFail(
                    "Expected successful sign-in but received an error: \(error)"
                )
            }
        }
    }
    
    func testSignInWithAppleFlow_Failure() {
        mockAppleLoginRepository.shouldSucceed = false
        Task {
            do {
                try await sut.signInWithAppleFlow()
                XCTFail(
                    "Expected failure but signInWithAppleFlow succeeded"
                )
            } catch {
                // Test passed if an error is thrown
            }
        }
    }

    override func tearDown() {
        sut = nil
        mockAppleLoginRepository = nil
        mockFirebaseAuthRepository = nil
        super.tearDown()
    }
}
