//
//  File.swift
//  
//
//  Created by 유준용 on 4/22/24.
//

import Foundation
import Domain

class MockFirebaseAuthRepository: RemoteAuthRepository {
    var shouldSucceed: Bool = true

    func login(credential: SocialLoginCredential) async throws {
        if !shouldSucceed {
            throw NSError(domain: "Firebase Login Failed", code: -1, userInfo: nil)
        }
    }
}
