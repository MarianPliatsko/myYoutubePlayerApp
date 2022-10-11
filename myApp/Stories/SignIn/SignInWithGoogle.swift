//
//  SignInWithGoogle.swift
//  myApp
//
//  Created by mac on 2022-09-22.
//

import Foundation
import GoogleSignIn

let signInConfig = GIDConfiguration(clientID: "680530358242-sg28ou00lu23hav5phqmi0aausuiubll.apps.googleusercontent.com")
let googleSignIn = GIDSignIn.sharedInstance

extension SignInViewController {
    
    @IBAction func signInGoogleBtnAction(_ sender: Any) {
//        googleLogin()
        self.showTabBarController()
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
