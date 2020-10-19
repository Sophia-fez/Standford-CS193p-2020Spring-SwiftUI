//
//  DouYinNetwork.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/15.
//

import Foundation
import Just

// 服务器数据地址封装
struct DouYinURL {
    static let baseLocal = "http://127.0.0.1:5500/"
    static let feedFile = "feed.json"
    
    static let commentLocal = URL(string: baseLocal + "/comment/xsy.json")!
}

typealias Success = () -> Void
typealias SuccessWithJson = (Any?) -> Void // 成功获取到json后要解析json

struct DouyinNetwork {
    static let ERROR = "json获取错误："
    
    // 获取本地评论的json
    static func getComment(success: @escaping SuccessWithJson) {
        DouyinNetwork.getJson(url: DouYinURL.commentLocal, success: success)
    }
    
    // 通用的get请求
    static func getJson(url: URL, success: @escaping SuccessWithJson) {
        Just.get(url, asyncCompletionHandler:  { (result) in
            if result.ok {
                success(result.content)
            } else {
                debugPrint(DouyinNetwork.ERROR, result.reason)
            }
        })
    }
}
