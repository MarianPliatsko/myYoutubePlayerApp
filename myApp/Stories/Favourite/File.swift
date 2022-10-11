//
//  File.swift
//  myApp
//
//  Created by mac on 2022-09-18.
//

import Foundation
class LocalStorageManager {
    static var local = LocalStorageManager()
    init() {}
    
    public func saveVideo(model: HomeModel) {
        do {
            
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(model)
            
            UserDefaults.standard.set(data, forKey: "favorite")
        } catch {
            print(error.localizedDescription)
        }
        
        if  let data = UserDefaults.standard.data(forKey: "favorite") {
        do {
            let decoder = JSONDecoder()
            let favorite = try decoder.decode(HomeModel.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        return
    }
    }
    public func removeUser() {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
        defaults.synchronize()
    }
}
