//
//  Model.swift
//  myApp
//
//  Created by mac on 2022-09-22.
//

import Foundation
import GoogleSignIn

class APIService {
    
    static var shared = APIService()
    var delegate: DataDelegate?
    var videoDelegate: VideoDataDelegate?
    let user = GIDSignIn.sharedInstance.currentUser
    
    var videoHomeData: [Video] = []
    var filteredHomeData: [Video] = []
    
    func getSearchVideos(query: String) {
        let queryItems = [URLQueryItem(name: "q", value: query),
                          URLQueryItem(name: "part", value: "snippet"),
                          URLQueryItem(name: "maxResults", value: "5"),
                          URLQueryItem(name: "type", value: "video"),
                          URLQueryItem(name: "key", value: Constants.API_KEY)]
        
        var urlComponents = URLComponents(string: Constants.API_URL_SEARCH)
        urlComponents?.queryItems = queryItems
        let url = urlComponents?.url
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        if let url = url {
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error != nil || data == nil {
                    // TODO: Handle error
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    if let data = data {
                        let response = try decoder.decode(Response.self, from: data)
                        if response.items != nil {
                            DispatchQueue.main.async {
                                self.videoHomeData = response.items ?? []
                                self.delegate?.videosFetched(response.items ?? [])
                            }
                        }
                    }
                }
                catch {
                    // TODO: Handle error
                }
            }
            
            dataTask.resume()
        }
    }
}
//    func getLikesVideo() {
//        let queryItems = [URLQueryItem(name: "part", value: "snippet%2CcontentDetails%2Cstatistics"),
//                          URLQueryItem(name: "maxResults", value: "5"),
//                          URLQueryItem(name: "myRating", value: "like"),
//                          URLQueryItem(name: "type", value: "video"),
//                          URLQueryItem(name: "access_token", value: "Bearer \(user?.authentication.accessToken)"),
//                          URLQueryItem(name: "key", value: Constants.API_KEY)]
//
//        var urlComponents = URLComponents(string: Constants.API_URL_VIDEOS)
//        urlComponents?.queryItems = queryItems
//        let url = urlComponents?.url
//
//        guard url != nil else {
//            return
//        }
//        let session = URLSession.shared
//        if let url = url {
//            let dataTask = session.dataTask(with: url) { data, response, error in
//                if error != nil || data == nil {
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.dateDecodingStrategy = .iso8601
//
//                    if let data = data {
//                        let response = try decoder.decode(Response.self, from: data)
//                        if response.items != nil {
//                            print("response:\(response.items)")
//                            DispatchQueue.main.async {
//                                self.videoDelegate?.videosDataFetched(response.items!)
//                            }
//                        }
//                    }
//                }
//                catch {
//
//                }
//            }
//            dataTask.resume()
//        }
//    }
//}
