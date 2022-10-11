//
//  VideoDataRepository.swift
//  myApp
//
//  Created by mac on 2022-09-13.
//

import Foundation

class FavoritesData {
    static let videoData = FavoritesData()
    
    private init() {}
    
    var favoriteData: [Video] = []
    
    func addToFavorites(video: Video) {
        if !favoriteData.contains(where: { $0.videoId == video.videoId }) {
            print("favoriteDataBefore\(favoriteData)")
            favoriteData.append(video)
            print("favoriteDataAfter\(favoriteData)")
        }
    }
    func removeFromFavorites(video: Video) {
        if let index = favoriteData.firstIndex(of: video) {
            favoriteData.remove(at: index)
        }
    }
    func fetchFavorites() -> [Video] {
        return favoriteData
    }
}
var videoHomeData: [Video] = []
var filteredHomeData: [Video] = []


