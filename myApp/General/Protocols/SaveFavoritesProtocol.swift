//import Foundation
//protocol PersistentManagerProtocol {
//    func setValue(_ newValue: HomeModel)
//    func getValue() -> [HomeModel]
//}
//
//class PersistentManager: PersistentManagerProtocol {
//    
//    static let shared = PersistentManager()
//    
//    private let userDefaults = UserDefaults.standard
//    private let key = "favorites"
//    
//    func setValue(_ newValue: HomeModel) {
//        var array = getValue()
//        array.append(newValue)
//        if let encoded = try? JSONEncoder().encode(array) {
//            UserDefaults.standard.set(encoded, forKey: key)
//        }
//    }
//    
//    func getValue() -> [HomeModel] {
//        if let data = UserDefaults.standard.object(forKey: key) as? Data,
//           let garments = try? JSONDecoder().decode([HomeModel].self, from: data) {
//            return garments
//        }
//        return []
//    }
//}
