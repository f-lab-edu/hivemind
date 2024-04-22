//
//  HomeViewController.swift
//  
//
//  Created by 유준용 on 3/25/24.
//

import RIBs
import UIKit

protocol HomePresentableListener: AnyObject {

}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(true)
        self.view.backgroundColor = .yellow
    }
}
