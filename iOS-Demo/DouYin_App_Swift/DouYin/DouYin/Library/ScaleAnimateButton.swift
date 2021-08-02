//
//  ScaleAnimateButton.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/16.
//

import UIKit

// 点击评论等icon一个缩小再放大的动画效果
class ScaleAnimateButton: UIButton {
    // 当view本身别添加到父视图之上时，增加一个点击事件
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        // 添加一个点击事件
        addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
    }
    
    @objc func toggleSelected() {
        isSelected.toggle()
    }
    
    // 为选中添加一个动画，缩小
    override var isSelected: Bool {
        get {
            super.isSelected
        }
        set {
            super.transform = .init(scaleX: 0.8, y: 0.8)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [.beginFromCurrentState, .transitionCrossDissolve]) {
                super.isSelected = newValue
                super.transform = .identity
            }
        }
    }
}

