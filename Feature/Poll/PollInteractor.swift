//
//  PollInteractor.swift
//  
//
//  Created by 유준용 on 4/16/24.
//

import RIBs
import RxSwift

protocol PollRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol PollPresentable: Presentable {
    var listener: PollPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol PollListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class PollInteractor: PresentableInteractor<PollPresentable>, PollInteractable, PollPresentableListener {

    weak var router: PollRouting?
    weak var listener: PollListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: PollPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
