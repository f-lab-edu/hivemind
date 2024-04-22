//
//  HomeInteractor.swift
//  
//
//  Created by 유준용 on 3/25/24.
//

import RIBs

public protocol HomeRouting: ViewableRouting { }

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }

}

public protocol HomeListener: AnyObject {

}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HomePresentable) {
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
