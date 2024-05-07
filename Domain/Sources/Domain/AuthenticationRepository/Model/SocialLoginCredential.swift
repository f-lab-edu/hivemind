//
//  File.swift
//  
//
//  Created by 유준용 on 4/21/24.
//

import Foundation

public struct SocialLoginCredential {
    public let idToken: String
    public let rawNonce: String?
    public let fullName: PersonNameComponents?
    
    public init(idToken: String, rawNonce: String?, fullName: PersonNameComponents?) {
        self.idToken = idToken
        self.rawNonce = rawNonce
        self.fullName = fullName
    }
}
