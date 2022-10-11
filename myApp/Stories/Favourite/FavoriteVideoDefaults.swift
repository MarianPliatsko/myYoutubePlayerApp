//
//  FavoriteVideoSettings.swift
//  myApp
//
//  Created by mac on 2022-09-15.
//

import Foundation

//class FavoriteVideoSettings {
//    
//    private enum SettingKeys: String {
//        case favoriteModel
//    }
//    
//    static var favoriteVideoModel: [HomeModel]? {
//        get {
//            guard let savedData = UserDefaults.standard.object(forKey: SettingKeys.favoriteModel.rawValue) as? Data,
//                  let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? HomeModel else {return nil}
//            print("decodedModel: \(decodedModel)")
//            return [decodedModel]
//        } set {
//            let defaults = UserDefaults.standard
//            let key = SettingKeys.favoriteModel.rawValue
//            if let favoriteModel = newValue {
//                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: favoriteModel, requiringSecureCoding: false) {
//                    defaults.set(savedData, forKey: key)
//                    print("savedData: \(savedData)")
//                }
//            }
//        }
//    }
//}
