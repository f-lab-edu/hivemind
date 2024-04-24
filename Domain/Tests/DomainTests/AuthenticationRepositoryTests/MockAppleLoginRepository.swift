//
//  File.swift
//  
//
//  Created by 유준용 on 4/24/24.
//

import Foundation
import Domain

class MockAppleLoginRepository: AppleLoginRepository {
    var shouldSucceed: Bool = true
    var signInResult: SocialLoginCredential?

    func signIn() async throws -> SocialLoginCredential {
        if shouldSucceed {
            if let result = signInResult {
                return result
            } else {
                throw NSError(domain: "No Credential", code: 0, userInfo: nil)
            }
        } else {
            throw NSError(domain: "Apple Login Failed", code: -1, userInfo: nil)
        }
    }
}
