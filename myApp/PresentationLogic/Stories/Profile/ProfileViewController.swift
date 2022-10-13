//
//  ProfileViewController.swift
//  myApp
//
//  Created by mac on 2022-08-10.
//

import UIKit
import GoogleSignIn

class ProfileViewController: UIViewController {
    // REVIEW: make private
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImageSize()
        updateUserProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
        moveToEditProfileController()
    }
    @IBAction func exitFromAccount(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
    }
    
    
    func moveToEditProfileController() {
        let storyboard = UIStoryboard(name: "EditProfile", bundle: nil)
        
        guard let playViewContoller = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController else { return }
        
        self.navigationController?.present(playViewContoller, animated: true)
    }
    
    func changeImageSize() {
        let profilePicture = UIImage(named: "profile_picture")
        image.image = profilePicture
        image.layer.cornerRadius = image.frame.height/2
        image.backgroundColor = .black
        view.addSubview(image)
    }
    func updateUserProfile() {
        if let user = GIDSignIn.sharedInstance.currentUser {
            nameLabel.text = user.profile?.name
            emailLabel.text = user.profile?.email

            let imageDimension = 200
            let imageUrl = user.profile?.imageURL(withDimension: UInt(imageDimension))
            let url = URL(string: imageUrl!.description)
            guard let url = url else {
                return
            }
            
            // REVIEW: replace with some SDK for example https://github.com/SDWebImage/SDWebImageFLPlugin
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil && data != nil {
                    if url.absoluteString != imageUrl?.description {
                        return
                    }
                    guard let data = data else {
                        return
                    }
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image.image = image
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}

