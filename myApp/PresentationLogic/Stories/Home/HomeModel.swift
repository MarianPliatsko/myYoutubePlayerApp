
import Foundation
import UIKit

class HomeModel:NSObject, Codable {

    var videoName: String
    var authorName: String
    
    init(videoName: String, authorName: String) {
        self.videoName = videoName
        self.authorName = authorName
    }
    
    static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        return lhs.authorName == rhs.authorName && lhs.videoName == rhs.videoName
    }
}


