//
//  AppComponent.swift
//  HiveMind
//
//  Created by 유준용 on 3/25/24.
//

import HomeImpl
import Home
import Login
import LoginImpl

final class AppComponent: HomeDependency, LoginDependency{
    
    lazy var homeBuildable: HomeBuildable = HomeBuilder(dependency: self)
    lazy var loginBuildable: LoginBuildable = LoginBuilder(dependency: self)
    
    init() {
                
    }
}
