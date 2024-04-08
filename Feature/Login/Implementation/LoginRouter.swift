//
//  LoginRouter.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import Auth
import AuthRepositories

import RIBs

protocol LoginInteractable: Interactable {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

protocol LoginViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoginRouter: LaunchRouter<LoginInteractable, LoginViewControllable>, LoginRouting, LoginListener {
    
    private var appleLoginService: AppleLoginService
    
    init(interactor: LoginInteractable,
                  viewController: LoginViewControllable,
                  appleLoginService: AppleLoginService) {
        self.appleLoginService = appleLoginService
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        interactor.listener = self
    }
    
    func startSignInWithAppleFlow() {
        appleLoginService.startSignInWithAppleFlow()
        print(#function)
    }
}
