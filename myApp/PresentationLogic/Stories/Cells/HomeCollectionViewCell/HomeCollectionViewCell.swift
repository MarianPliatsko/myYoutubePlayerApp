//
//  HomeCollectionViewCell.swift
//  myApp
//
//  Created by mac on 2022-08-29.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var dateOfVideoCreated: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with videoData: Video) {
        myLabel.text = videoData.title
        myImageView.contentMode = .scaleToFill
        
        dateOfVideoCreated.text = HomeCollectionViewCell.dateFormatter.string(from: videoData.published)
        
        guard videoData.thumbnail.isEmpty else {
            return
        }
        
        let url = URL(string: videoData.thumbnail)
        guard let url = url else {
            return
        }
        
        let session = URLSession.shared
        
        // REVIEW: replace with some SDK for example https://github.com/SDWebImage/SDWebImageFLPlugin
//        let dataTask = session.dataTask(with: url) { data, response, error in
//            if error == nil && data != nil {
//                if url.absoluteString != videoData.thumbnail {
//                    return
//                }
//
//                guard let data = data else {
//                    return
//                }
//
//                let image = UIImage(data: data)
//                DispatchQueue.main.async {
//                    self.myImageView.image = image
//                }
//            }
//        }
//        dataTask.resume()
    }
}

