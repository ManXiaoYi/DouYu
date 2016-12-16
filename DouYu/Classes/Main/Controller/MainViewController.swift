//
//  MainViewController.swift
//  DouYu
//
//  Created by 满孝意 on 2016/11/21.
//  Copyright © 2016年 满孝意. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC("Home")
        addChildVC("Live")
        addChildVC("Follow")
        addChildVC("Profile")
    }
    
    fileprivate func addChildVC(_ storyName: String) {
        // 1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2.将childVc作为子控制器
        addChildViewController(childVc)
    }
}
