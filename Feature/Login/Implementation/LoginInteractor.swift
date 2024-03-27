//
//  LoginInteractor.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import RxSwift
import Login

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }

}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {
    
    func requestLogin() {   
    }
    

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
}
