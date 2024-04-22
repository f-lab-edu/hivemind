//
//  File.swift
//  
//
//  Created by 유준용 on 4/22/24.
//

import Foundation

public protocol RemoteAuthRepository {
    func login(credential: SocialLoginCredential) async throws
}

