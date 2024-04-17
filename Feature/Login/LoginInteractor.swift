//
//  LoginInteractor.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import RxSwift
import FirebaseAuth

import Domain
import DataAccess

public protocol LoginRouting: ViewableRouting {
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

public protocol LoginListener: AnyObject {
    func dismissLoginFlow()
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener, SocialSignInDelegate {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?
    
    let appleSignInService: AppleSignInService
    
    init(presenter: LoginPresentable,
         appleSignInService: AppleSignInService
         
    ) {
        self.appleSignInService = appleSignInService
        super.init(presenter: presenter)
        presenter.listener = self
        self.appleSignInService.delegate = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

    }
    
    override func willResignActive() {
        super.willResignActive()
    }
    
    func didTapAppleLoginButton() {
        appleSignInService.startSignInFlow()
    }
    
    func didCompleteSignIn(error: (any Error)?) {
        print(#function, #file, #line)
        listener?.dismissLoginFlow()
    }
}
