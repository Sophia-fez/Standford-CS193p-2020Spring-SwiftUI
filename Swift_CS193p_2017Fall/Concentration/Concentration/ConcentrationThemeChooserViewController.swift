//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Sophia_fez on 2020/8/1.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    // 取消默认的Helloween主题
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true // true意味着有 collapse it，但是 you should
            }
        }
        return false // false意味着没有 collapse it，所以 you should do it
    }
    
    // 手动建立的segue
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            // ipad不重新开始游戏更换theme的功能，在splitview里找ConcentrationViewController
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            // iphone上返回后切换theme但不重新开始游戏，从heap中重新push it on the navigation stack
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            // do degue frome code
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    // 在splitViewController的detail里找ConcentrationViewController，因为只有ipad有split view所以只对ipad起效
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    // MARK: - Navigation
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?

    // 如果直接用button建立的segue就只要这个 func就可以了
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    // hold on, keep it in heep,即使按下返回键，虽然弹出了navigation stack，但是还会保留在heap里
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }

}
