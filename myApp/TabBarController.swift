//
//  ViewController.swift
//  myApp
//
//  Created by mac on 2022-08-10.
//

import UIKit
import GoogleSignIn

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .label
        
        let view = createViewControllers()
        self.viewControllers = view
        
    }
    
    func createViewControllers() -> [UIViewController] {
        // REVIEW: - create separate storyBoards to each flaw
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
        let favoriteViewController = storyBoard.instantiateViewController(withIdentifier: "FavoriteViewController")
        let profileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController")
        
        // REVIEW: - create separate storyBoards to each flaw
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        favoriteViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        profileViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        homeViewController.title = "Home"
        favoriteViewController.title = "Favorite"
        profileViewController.title = "Profile"
        
        return [homeViewController, favoriteViewController, profileViewController]
        
    }
    
}

