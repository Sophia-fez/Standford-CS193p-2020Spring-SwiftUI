//
//  TabBar.swift
//  QiuShi
//
//  Created by Sophia_fez on 2020/9/1.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class TabBar: UITabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        subviews.filter { $0 is UIControl }.forEach { }
        
        // 将bar的icon往上一点
        for button in subviews where button is UIControl {
            var frame = button.frame
            frame.origin.y = -1
            button.frame = frame
        }
    }

}
