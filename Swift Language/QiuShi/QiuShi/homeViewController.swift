//
//  homeViewController.swift
//  QiuShi
//
//  Created by Sophia_fez on 2020/9/1.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class homeViewController: UIViewController {
    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        request(API.imagrank, parameters: ["page": 1]).responseJSON {
            response in
            
            guard let dict = response.result.value else {return}
            
            // SwiftyJSON里的类型
            let items = JSON(dict)["items"].arrayObject
            print(items)
            
//            if let dict = response.result.value as? [String: Any] {
//                if let items = dict["items"] as? [[String: Any]] {
//                    print(items)
//                }
//            }
        }
        
//        // 字典转模型
//        let json: [String: Any] = [:]
//        if let dict = json["data"] as? [String: Any] {
//            if let name = dict["name"] as? String {
//
//            }
//        }
    }
    
    
}
