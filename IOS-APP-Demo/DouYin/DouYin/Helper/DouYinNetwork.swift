//
//  DouYinNetwork.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/15.
//

import Foundation
import Just

// 服务器数据地址封装
struct DouyinURL {
    static let base = "http://xxxx/" //Your Remote Server Address 你的外网数据服务器地址
    static let latestFeed = DouyinURL.base + "feed/"
    static let login = DouyinURL.base + "mylogin/"
    static let comment = DouyinURL.base + "/common/?aweme_id="
    static let feedUrl = URL(string: latestFeed)!
    
    static let baseLocal = "http://127.0.0.1:5500/"
    static let feedFile = "feed.json"
    static let commentLocal = URL(string: baseLocal + "/comment/xsy.json")!
}

typealias Success = () -> Void
typealias SuccessWithJson = (Any?) -> Void // 成功获取到json后要解析json

struct DouyinNetwork {
    static let AUTH_OK = "鉴权成功"
    static let AUTH_ERR = "鉴权失败:"
    
    static let ERROR = "json获取错误："
    
    // 获取本地评论的json
    static func getComment(success: @escaping SuccessWithJson) {
        DouyinNetwork.getJson(url: DouyinURL.commentLocal, success: success)
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
    
    //api调用鉴权
    static func checkAuth(success: @escaping Success)   {
        //form表单提交用post， 用data提交
        Just.post(DouyinURL.login, data: ["username": "xxx", "password":"123"], asyncCompletionHandler:  { (r) in
            if r.ok {
                debugPrint(DouyinNetwork.AUTH_OK)
                success()
            } else {
                debugPrint(DouyinNetwork.AUTH_ERR,r.reason)
            }
        })
    }
}
