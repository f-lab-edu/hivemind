//
//  LoginInteractor.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import RxSwift


public protocol LoginRouting: ViewableRouting {
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

public protocol LoginListener: AnyObject {
    func startSignInWithAppleFlow()
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {

    

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func didTapAppleLoginButton() {
        listener?.startSignInWithAppleFlow()
    }
}
