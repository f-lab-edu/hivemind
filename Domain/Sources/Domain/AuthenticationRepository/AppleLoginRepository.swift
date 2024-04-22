//
//  File.swift
//  
//
//  Created by 유준용 on 4/22/24.
//

import Foundation

public protocol AppleLoginRepository {
    func signIn() async throws -> SocialLoginCredential
}
