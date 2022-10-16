//
//  EditProfileViewController.swift
//  myApp
//
//  Created by mac on 2022-09-15.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    private let profileVC = ProfileViewController()
    
    @IBOutlet weak var editProfileImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    @IBAction func cancelEditingButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeProfileImageViewButton(_ sender: Any) {
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
}

