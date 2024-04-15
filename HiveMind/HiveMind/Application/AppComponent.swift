//
//  AppComponent.swift
//  HiveMind
//
//  Created by 유준용 on 3/25/24.
//

import Domain
import DataAccess
import Home
import Login

final class AppComponent: HomeDependency, LoginDependency{
        
    lazy var appleLoginService = AppleLoginService()
    lazy var homeBuildable: HomeBuildable = HomeBuilder(dependency: self)
    lazy var loginBuildable: LoginBuildable = LoginBuilder(dependency: self)
    
    init() {
    }
}
