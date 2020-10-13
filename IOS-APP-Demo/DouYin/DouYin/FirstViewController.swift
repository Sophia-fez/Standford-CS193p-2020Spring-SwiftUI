//
//  FirstViewController.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/13.
//

import Foundation
import UIKit
import SnapKit
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let box = UIView()
        box.backgroundColor = UIColor.blue
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            // 宽高设置为100
            make.size.equalTo(100)
            // 在父视图居中显示
            make.center.equalToSuperview()
        }
    }
}
