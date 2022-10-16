//
//  HomeTableViewCell.swift
//  myApp
//
//  Created by mac on 2022-08-25.
//

import UIKit

class HomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let homeVC = HomeViewController()
    var itemDelegate: CustomVideoItemDelegate?
    
    var videoHomeData: [Video] {
        APIService.shared.videoHomeData
    }

    @IBOutlet var homeCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        nib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        homeCollectionView.reloadData()
    }
    
    private func nib() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoHomeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: videoHomeData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if itemDelegate != nil {
            itemDelegate?.didSelectItem(video: videoHomeData[indexPath.row])
        }
    }
}




