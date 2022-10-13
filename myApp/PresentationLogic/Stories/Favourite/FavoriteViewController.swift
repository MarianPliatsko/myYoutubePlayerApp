//
//  FavoriteViewController.swift
//  myApp
//
//  Created by mac on 2022-08-11.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoritesData: [Video] = []
    
    // REVIEW: make private
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritesData = FavoritesData.videoData.fetchFavorites()
        favoritesTableView.reloadData()
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoritesTableView.register(nib, forCellReuseIdentifier: "FavoriteTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        let favorite = favoritesData[indexPath.row]
        cell.configure(with: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(favorite: favoritesData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func didSelectRow(favorite: Video) {
        guard let playViewController = storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as? PlayViewController else {
            return
        }
        
        playViewController.video = favorite
        self.navigationController?.pushViewController(playViewController, animated: true)
    }
}
