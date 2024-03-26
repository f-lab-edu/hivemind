//
//  AppComponent.swift
//  HiveMind
//
//  Created by 유준용 on 3/25/24.
//

import HomeImpl
import Home

final class AppComponent: HomeDependency{
    
    lazy var homeBuildable: HomeBuildable = HomeBuilder(dependency: self)
    
    init() {
                
    }
}
