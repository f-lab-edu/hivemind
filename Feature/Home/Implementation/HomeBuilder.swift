//
//  HomeBuilder.swift
//
//
//  Created by 유준용 on 3/25/24.
//

import RIBs
import Home

public protocol HomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class HomeComponent: Component<HomeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    public override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> LaunchRouting {
        _ = HomeComponent(dependency: self.dependency)
      let viewController = HomeViewController()
        viewController.view.backgroundColor = .white
      let interactor = HomeInteractor(presenter: viewController)
      return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
