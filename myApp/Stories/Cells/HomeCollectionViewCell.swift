//
//  HomeCollectionViewCell.swift
//  myApp
//
//  Created by mac on 2022-08-29.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var dateOfVideoCreated: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with videoData: Video) {
        self.myLabel.text = videoData.title
        
        self.myImageView.contentMode = .scaleToFill
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        self.dateOfVideoCreated.text = df.string(from: videoData.published)
        
        guard videoData.thumbnail != "" else {
            return
        }
        let url = URL(string: videoData.thumbnail)
        guard let url = url else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil && data != nil {
                if url.absoluteString != videoData.thumbnail {
                    return
                }
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.myImageView.image = image
                }
            }
        }
        dataTask.resume()
    }
}

