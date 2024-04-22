//
//  File.swift
//
//
//  Created by 유준용 on 4/22/24.
//

import FirebaseAuth
import Domain

public class FirebaseAuthRepositoryImpl: RemoteAuthRepository {
    
    public func login(credential: SocialLoginCredential) async throws {
        let firebaseCredential = OAuthProvider.appleCredential(withIDToken: credential.idToken,
                                                               rawNonce: credential.rawNonce,
                                                               fullName: credential.fullName)
        do {
            let authResult = try await Auth.auth().signIn(with: firebaseCredential)
            print("Firebase Auth successful for user: \(authResult.user.uid)")
        } catch {
            print("Firebase Auth failed with error: \(error)")
            throw error
        }
    }

    public init() {}
}
