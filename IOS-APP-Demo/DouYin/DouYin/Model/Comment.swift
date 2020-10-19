//
//  Comment.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import Foundation

// 一条评论
struct Comment: Codable {
    var text: String       // 评论的内容
    var digg_count: Int    // 点赞数
    var create_time: Int   // 评论时间
    var user: User         // 用户头像、用户名
    var replay_comment: [Comment]? // 暂时不实现，其实就是评论中套着评论，格式是一样的
}

// 该视频的所有评论
struct Comments: Codable {
    var comments: [Comment]
}
