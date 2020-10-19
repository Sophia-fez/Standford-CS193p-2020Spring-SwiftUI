//
//  ShareController.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/19.
//

import UIKit

class ShareController: UIViewController {
    
    @IBOutlet weak var shareAreaView: UIView!
    @IBOutlet weak var weichatBtn: UIButton!
    
    // TODO: 弹窗代码复用
    // 点击取消按钮关闭分享弹窗
    @IBAction func tapClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // 点击其他空白区域分享评论弹窗
    @IBAction func tapToClose(_ sender: UITapGestureRecognizer) {
        // 单机手势点击时相对于分享弹窗view的位置
        let tapPoint = sender.location(in: shareAreaView)
        
        // 如果位置不位与分享view内则关闭该view,即这个view包不包含点击的这个点
        if !shareAreaView.layer.contains(tapPoint) {
            self.dismiss(animated: true)
        }
    }
    
    
}
