//
//  HomeInterface.swift
//
//
//  Created by 유준용 on 3/25/24.
//

import RIBs
import Foundation

public protocol HomeBuildable: Buildable {
    func build() -> LaunchRouting
}

