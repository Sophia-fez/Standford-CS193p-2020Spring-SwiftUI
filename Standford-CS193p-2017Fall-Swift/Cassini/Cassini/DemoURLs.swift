//
//  DemoURLs.swift
//  Cassini
//
//  Created by CS193p Instructor.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation

struct DemoURLs
{
//	static let   = Bundle.main.url(forResource: "test", withExtension: "jpeg")
	
    static let Forest = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596707392288&di=51bfc2795085ed7242fbf4cab567587f&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201301%2F05%2F163809wo066osj41x6xwo2.jpg")
	
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Tree" : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596708132005&di=960212db9ea920857640d739ea8d6785&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F569%2F285%2F149%2F66bcad17f5f74d49b3cea54149d5e347.jpg",
            "Sea" : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596707392289&di=33215bcaccd5f7825c4fe8711c02ba6f&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F58b4ef69ed377.jpg",
            "Mountain" : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596707392288&di=fa4bd6178327582d035bfaae5dba4301&imgtype=0&src=http%3A%2F%2Fimg8.zol.com.cn%2Fbbs%2Fupload%2F19779%2F19778120.JPG"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
