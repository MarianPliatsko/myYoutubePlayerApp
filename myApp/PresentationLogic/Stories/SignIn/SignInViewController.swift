//
//  SignInViewController.swift
//  myApp
//
//  Created by mac on 2022-09-25.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {
    
    private let signInConfig = GIDConfiguration(clientID: "680530358242-sg28ou00lu23hav5phqmi0aausuiubll.apps.googleusercontent.com")
    private let googleSignIn = GIDSignIn.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showTabBarController() {
        let main = TabBarController()
        self.show(main, sender: self)
    }
    
    @IBAction func signInGoogleBtnAction(_ sender: Any) {
        googleLogin()
    }
    
    func googleLogin() {
        googleSignIn.signIn(with: signInConfig, presenting: self) { user, error in
            if error == nil {
                if user != nil {
                    let accessToken = user?.authentication.accessToken ?? ""
                    print("Access Tocken: \(accessToken)")
                    self.showTabBarController()
                }
            }
        }
    }
}
