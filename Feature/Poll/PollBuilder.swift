//
//  PollBuilder.swift
//  
//
//  Created by 유준용 on 4/16/24.
//

import RIBs

protocol PollDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class PollComponent: Component<PollDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol PollBuildable: Buildable {
    func build(withListener listener: PollListener) -> PollRouting
}

final class PollBuilder: Builder<PollDependency>, PollBuildable {

    override init(dependency: PollDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PollListener) -> PollRouting {
        let component = PollComponent(dependency: dependency)
        let viewController = PollViewController()
        let interactor = PollInteractor(presenter: viewController)
        interactor.listener = listener
        return PollRouter(interactor: interactor, viewController: viewController)
    }
}
