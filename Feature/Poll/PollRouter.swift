//
//  PollRouter.swift
//  
//
//  Created by 유준용 on 4/16/24.
//

import RIBs

protocol PollInteractable: Interactable {
    var router: PollRouting? { get set }
    var listener: PollListener? { get set }
}

protocol PollViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class PollRouter: ViewableRouter<PollInteractable, PollViewControllable>, PollRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: PollInteractable, viewController: PollViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
