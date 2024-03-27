//
//  HomeRouter.swift
//  
//
//  Created by 유준용 on 3/25/24.
//

import RIBs

protocol HomeInteractable: Interactable {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
}

final class HomeRouter: LaunchRouter<HomeInteractable, HomeViewControllable>, HomeRouting {

    override init(interactor: HomeInteractable, viewController: HomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
