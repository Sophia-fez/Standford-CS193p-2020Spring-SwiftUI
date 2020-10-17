//
//  Helper.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/16.
//

import Foundation

// 保留万 w
extension Int {
    var toWantStr: String {
        if self > 10000 {
            let a = Double(exactly: self)! / 10000.0
            return round(a).description + "w"
        }
        return self.description
    }
}
