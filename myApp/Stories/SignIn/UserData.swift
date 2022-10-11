//
//  UserData.swift
//  myApp
//
//  Created by mac on 2022-10-05.
//

import Foundation

struct UserData: Decodable {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
