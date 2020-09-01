//
//  homeViewController.swift
//  QiuShi
//
//  Created by Sophia_fez on 2020/9/1.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        // 字典转模型
        let json: [String: Any] = [:]
        if let dict = json["data"] as? [String: Any] {
            if let name = dict["name"] as? String {
                
            }
        }
    }
    
    
}
