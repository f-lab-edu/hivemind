//
//  AppRootBuilder.swift
//  HiveMind
//
//  Created by 유준용 on 4/16/24.
//

import RIBs

import Home
import Login

public protocol AppRootDependency: Dependency, HomeDependency, LoginDependency {

}

final class AppRootComponent: Component<AppRootDependency> {

}

// MARK: - Builder

public protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

public final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {

    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> LaunchRouting {
        let component = AppRootComponent(dependency: dependency)
        let viewController = AppRootViewController()
        let interactor = AppRootInteractor(presenter: viewController)
        return AppRootRouter(interactor: interactor, 
                             viewController: viewController,
                             homeBuilder: HomeBuilder(dependency: component.dependency),
                             loginBuilder: LoginBuilder(dependency: component.dependency)
        )
    }
}
