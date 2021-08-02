//
//  User.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import Foundation

struct User: Codable {
    var nickname: String
    var avatar_thumb: Avatar_thumb // 头像
    
}

struct Avatar_thumb: Codable {
    var url_list: [String]
}
