//
//  AppRootViewController.swift
//  HiveMind
//
//  Created by 유준용 on 4/16/24.
//

import RIBs
import RxSwift
import UIKit

protocol AppRootPresentableListener: AnyObject {

}

final class AppRootViewController: UIViewController, AppRootPresentable, AppRootViewControllable {

    weak var listener: AppRootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
    
    func replaceScreen(_ viewControllerable: ViewControllable){
        self.addChild(viewControllerable.uiviewController)
        self.view.addSubview(viewControllerable.uiviewController.view)
        viewControllerable.uiviewController.didMove(toParent: self)
    }
}
