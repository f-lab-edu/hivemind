//
//  SceneDelegate.swift
//  HiveMind
//
//  Created by 유준용 on 3/22/24.
//
import UIKit

import RIBs

import Home

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appComponent = AppComponent()
    var launchRouter: LaunchRouting?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        configureAppLaunch()
        print("App Start")
    }
}

extension SceneDelegate {
    private func configureAppLaunch() {
        guard let window = window else { return }
//        self.launchRouter = self.appComponent.homeBuildable.build()
        self.launchRouter = self.appComponent.loginBuildable.build()
        self.launchRouter?.launch(from: window)
    }
}

