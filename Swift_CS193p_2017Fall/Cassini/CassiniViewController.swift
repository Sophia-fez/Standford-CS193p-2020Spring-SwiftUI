//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Sophia_fez on 2020/8/4.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
//                var destination = segue.destination
//                if let navcon = destination as? UINavigationController {
//                    // ipad 上显示 title，先检查是否是navigation controller
//                    destination = navcon.visibleViewController ?? navcon
//                }
//                if let imageVC = destination as? ImageViewController {
//                    imageVC.imageURL = url
//                    imageVC.title = (sender as? UIButton)?.currentTitle
//                }
                
                // 用extension实现
                if let imageVC = segue.destination.contents as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }

}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            // ipad 上显示 title，先检查是否是navigation controller
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
