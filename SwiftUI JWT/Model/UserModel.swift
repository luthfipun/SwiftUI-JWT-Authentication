//
//  UserModel.swift
//  SwiftUI JWT
//
//  Created by Luthfi Abdul Azis on 05/03/21.
//

import Foundation

struct UserModel: Codable {
    var code: Int = 0
    var message: String = ""
    var data: [UserEntity] = []
}

struct UserEntity: Codable {
    let id: Int
    let name: String
    let email: String
    let token: String
}
