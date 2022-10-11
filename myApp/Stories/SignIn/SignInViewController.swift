//
//  SignInViewController.swift
//  myApp
//
//  Created by mac on 2022-09-25.
//

import UIKit

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func showTabBarController() {
        let main = TabBarController()
        self.show(main, sender: self)
    }
}
