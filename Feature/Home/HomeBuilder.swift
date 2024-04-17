//
//  HomeBuilder.swift
//
//
//  Created by 유준용 on 3/25/24.
//

import RIBs

public protocol HomeDependency: Dependency {

}

final class HomeComponent: Component<HomeDependency> {

}

public protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

public final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    public override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: HomeListener) -> HomeRouting {
        _ = HomeComponent(dependency: self.dependency)
      let viewController = HomeViewController()
        viewController.view.backgroundColor = .white
      let interactor = HomeInteractor(presenter: viewController)
      return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
