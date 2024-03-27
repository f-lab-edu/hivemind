//
//  HomeInterface.swift
//
//
//  Created by 유준용 on 3/25/24.
//

import Foundation
import RIBs

public protocol HomeBuildable: Buildable {
    func build() -> LaunchRouting
}

