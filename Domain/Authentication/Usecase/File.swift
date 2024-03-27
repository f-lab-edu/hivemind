//
//  File.swift
//
//
//  Created by 유준용 on 3/27/24.
//

import Foundation

protocol LoginUseCase {
  func signInWithApple() async throws -> User
}

class DefaultLoginUseCase: LoginUseCase {
  private let loginRepository: LoginRepository

  init(loginRepository: LoginRepository) {
    self.loginRepository = loginRepository
  }

  func signInWithApple() async throws -> User {
    return try await loginRepository.signInWithApple(using: credential)
  }
}
