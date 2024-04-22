//
//  LoginInteractor.swift
//
//
//  Created by 유준용 on 3/27/24.
//
import UIKit
import RIBs
import Domain

public protocol LoginRouting: ViewableRouting {
    
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

public protocol LoginListener: AnyObject {
    func dismissLoginFlow()
}

public protocol LoginInteractorDependency {
    var socialAuthenticator: SocialAuthenticatable { get }
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    let dependency: LoginInteractorDependency
    
    init(presenter: LoginPresentable,
         dependency: LoginInteractorDependency
    ) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    func didTapAppleLoginButton() {
        self.appleLoginFlow()
    }
    
    private func appleLoginFlow() {
        Task {
            do {
                try await dependency.socialAuthenticator.signInWithAppleFlow()
                dismissLoginFlow()
            } catch {
                print("Error during sign in: \(error.localizedDescription)")
            }
        }
    }
    
    private func dismissLoginFlow(){
        DispatchQueue.main.async {
            self.listener?.dismissLoginFlow()
        }
    }
}
