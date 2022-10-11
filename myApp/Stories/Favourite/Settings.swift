//
//  Settings.swift
//  myApp
//
//  Created by mac on 2022-09-18.
//

import Foundation

struct Settings {
    static var shared = Settings()
    
    let defaults = UserDefaults.standard
    
    func archiveJSON<T: Encodable>(value: T, key: String) {
        let data = try! JSONEncoder().encode(value)
        let string = String(data: data, encoding: .utf8)
        defaults.set(string, forKey: key)
        print("defaults:\(defaults)")
    }
    
    func unarchiveJSON<T: Decodable>(key: String) -> T? {
        guard let string = defaults.string(forKey: key),
              let data = string.data(using: .utf8) else {
                  return nil
              }
        print("unarchiveJSON:\(data)")
        return try? JSONDecoder().decode(T.self, from: data)
        
    }
}
