//
//  HomeViewController.swift
//  myApp
//
//  Created by mac on 2022-08-11.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var data = Data()
    
    // MARK: - Outlets
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        homeSearchBar.delegate = self
        APIService.shared.delegate = self
        APIService.shared.getSearchVideos(query: homeSearchBar.text ?? "")
    }
    
    // MARK: - Register Cell
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    // MARK: - SearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        let finalKeywords = keywords?.replacingOccurrences(of: " ", with: "+")
        APIService.shared.getSearchVideos(query: finalKeywords ?? "")
    }
}

// MARK: - TableView Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("videosCount:\(videoHomeData.count)")
        return videoHomeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.itemDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}

// MARK: - DataDelegate

extension HomeViewController: DataDelegate {
    func videosFetched(_ videos: [Video]) {
        videoHomeData = videos
        homeTableView.reloadData()
    }
}

// MARK: - CustomVideoItemDelegate

extension HomeViewController: CustomVideoItemDelegate {
    func didSelectItem(video: Video) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let playViewContoller = storyboard.instantiateViewController(withIdentifier: "PlayViewController") as? PlayViewController else { return }
        
        // review: - what model should be in PlayViewController? Home or Favourite?
        playViewContoller.video = video
        self.navigationController?.pushViewController(playViewContoller, animated: true)
    }
}

