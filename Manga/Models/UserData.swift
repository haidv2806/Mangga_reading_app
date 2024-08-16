//
//  UserData.swift
//  Manga
//
//  Created by Đỗ Văn Hải on 13/8/24.
//

import Foundation

struct UserData: Codable{
    let device_name_register: String
    let email: String
    let id_user: Int
    let ip_register: String
    let link_avatar: String
    let user_name: String
    let password: String
}

//extension DefaultsKeys {
//    static let email = DefaultsKey<String?>("email")
//    static let password = DefaultsKey<String?>("password")
//    static let islogin = DefaultsKey<Bool?>("islogin")
//}
