//
//  tabBarViewController.swift
//  QiuShi
//
//  Created by Sophia_fez on 2020/9/1.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(TabBar(), forKeyPath: "tabBar")
        tabBar.barTintColor = UIColor.white
        
        addChild("home", "home", "home_active", homeViewController.self)
        addChild("trend", "trend", "trend_active", trendViewController.self)
        addChild("live", "live", "live_active", liveViewController.self)

    }
    
    func addChild(_ title: String, _ image: String, _ selectImage: String, _ type: UIViewController.Type) {
        let child = UINavigationController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.image = UIImage(named: image)
        child.tabBarItem.selectedImage = UIImage(named: selectImage)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07319629937, green: 0.587113142, blue: 0.8577551246, alpha: 1)], for: .selected)
        addChild(child)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
