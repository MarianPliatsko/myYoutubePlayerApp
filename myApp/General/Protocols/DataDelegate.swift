//
//  DataDelegate.swift
//  myApp
//
//  Created by mac on 2022-10-03.
//

import Foundation

protocol DataDelegate {
    func videosFetched(_ videos: [Video])
}

protocol VideoDataDelegate {
    func videosDataFetched(_ videos: [Video])
}
