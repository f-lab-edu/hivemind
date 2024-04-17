//
//  PollViewController.swift
//  
//
//  Created by 유준용 on 4/16/24.
//

import RIBs
import RxSwift
import UIKit

protocol PollPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class PollViewController: UIViewController, PollPresentable, PollViewControllable {

    weak var listener: PollPresentableListener?
}
