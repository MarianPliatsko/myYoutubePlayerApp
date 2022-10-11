//
//  FavoriteTableViewCell.swift
//  myApp
//
//  Created by mac on 2022-08-20.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var videoDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with videoData: Video) {
        self.videoDescription.text = videoData.title
        self.myImageView.contentMode = .scaleToFill
        
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

