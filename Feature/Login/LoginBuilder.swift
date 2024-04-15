//
//  LoginBuilder.swift
//  
//
//  Created by 유준용 on 3/27/24.
//
import DataAccess
import Domain

import RIBs
import Login

public protocol LoginDependency: Dependency {
    var appleLoginService: AppleLoginService { get }
}

final class LoginComponent: Component<LoginDependency> {
    var appleLoginService: AppleLoginService {
        dependency.appleLoginService
    }
}

public protocol LoginBuildable: Buildable {
    func build() -> LaunchRouting
}

public final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    public override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> LaunchRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController)
        let appleLoginService = AppleLoginService()
        return LoginRouter(interactor: interactor, 
                           viewController: viewController,
                           appleLoginService: component.appleLoginService)
    }
}
