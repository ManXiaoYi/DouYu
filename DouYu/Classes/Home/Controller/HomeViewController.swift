//
//  HomeViewController.swift
//  DouYu
//
//  Created by 满孝意 on 2016/11/21.
//  Copyright © 2016年 满孝意. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
    
}

// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        // 设置导航栏
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // 1. leftBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2. rightItem
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
}
