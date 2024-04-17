//
//  AppRootRouter.swift
//  HiveMind
//
//  Created by 유준용 on 4/16/24.
//

import RIBs

import Login
import Home

protocol AppRootInteractable: Interactable, LoginListener, HomeListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func replaceScreen(_ viewControllerable: ViewControllable)
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let homeBuilder: HomeBuilder
    private let loginBuilder: LoginBuilder
    
    init(interactor: AppRootInteractable,
         viewController: AppRootViewControllable,
         homeBuilder: HomeBuilder,
         loginBuilder: LoginBuilder
    ) {
        self.homeBuilder = homeBuilder
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachLogin(){
        let router = loginBuilder.build(withListener: interactor)
        attachChild(router)
        self.viewController.replaceScreen(router.viewControllable)
    }
    
    func attachHome(){
        let router = homeBuilder.build(withListener: interactor)
        attachChild(router)
        self.viewController.replaceScreen(router.viewControllable)
    }
}
