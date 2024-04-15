//
//  LoginViewController.swift
//  
//
//  Created by 유준용 on 3/27/24.
//

import RIBs
import RxSwift
import UIKit

import SnapKit

protocol LoginPresentableListener: AnyObject {
    func didTapAppleLoginButton()
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {
    
    //MARK: - Properties
    
    fileprivate var currentNonce: String?
    
    weak var listener: LoginPresentableListener?
    
    //MARK: - UI Components
    
    private lazy var appleLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Apple Login", for: .normal)
        btn.addTarget(self, action: #selector(appleLoginButtonDidTap), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.configureUI()
    }
    
    //MARK: - configureUI
    
    private func configureUI(){
        self.view.addSubview(self.self.appleLoginButton)
        self.appleLoginButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func appleLoginButtonDidTap(){
        self.listener?.didTapAppleLoginButton()
    }
}

