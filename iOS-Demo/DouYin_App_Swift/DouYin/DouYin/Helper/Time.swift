//
//  Time.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import Foundation

extension TimeInterval {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(self)
        
        if secondsAgo >= 86400 * 2 {
            return "\(((secondsAgo / 60) / 60) / 24)天前"
        } else if secondsAgo >= 86400 {
            return "1天前"
        } else if secondsAgo >= 7200 {
            return "\((secondsAgo / 60) / 60)小时前"
        } else if secondsAgo >= 3600 {
            return "1小时前"
        } else if secondsAgo >= 120 {
            return "\(secondsAgo / 60)分钟前"
        } else if secondsAgo > 60 {
            return "1分钟前"
        }
        
        return "刚刚"
    }
}
