//
//  LoginBuilder.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import Domain


public protocol LoginDependency: Dependency {
    var socialAuthenticator: SocialAuthenticatable { get }
}

final class LoginComponent: Component<LoginDependency>, LoginInteractorDependency {
    var socialAuthenticator: SocialAuthenticatable {
        dependency.socialAuthenticator
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
        let interactor = LoginInteractor(
            presenter: viewController,
            dependency: component
        )
        interactor.listener = listener
        return LoginRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
