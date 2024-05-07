//
//  AppRootInteractor.swift
//  HiveMind
//
//  Created by 유준용 on 4/16/24.
//

import RIBs
import RxSwift
import Foundation

protocol AppRootRouting: ViewableRouting {
    func attachLogin()
    func attachHome()
}

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AppRootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AppRootInteractor: PresentableInteractor<AppRootPresentable>, AppRootInteractable, AppRootPresentableListener {
    func dismissLoginFlow() {
        self.router?.attachHome()
    }
    

    
    
    weak var router: AppRootRouting?
    weak var listener: AppRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AppRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        self.router?.attachLogin()
//        let didLogin = UserDefaults.standard.bool(forKey: "didLogin")
//        if didLogin {
//            self.router?.attachHome()
//        }else{
//            self.router?.attachLogin()
//        }
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    

}
