//
//  LoginBuilder.swift
//  
//
//  Created by 유준용 on 3/27/24.
//
import DataAccess ❌
import Domain

import RIBs


// UI -> Domain <- DataAccess

public protocol LoginDependency: Dependency {
    var appleSignInService: AppleSignInService { get }
}

final class LoginComponent: Component<LoginDependency> {
    var appleSignInService: AppleSignInService {
        dependency.appleSignInService
    }
}

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

public final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    public override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController, 
                                         appleSignInService: component.appleSignInService)
        interactor.listener = listener
        return LoginRouter(interactor: interactor,
                           viewController: viewController)
    }
}
