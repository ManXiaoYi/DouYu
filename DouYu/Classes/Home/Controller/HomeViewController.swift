//
//  HomeViewController.swift
//  DouYu
//
//  Created by 满孝意 on 2016/11/21.
//  Copyright © 2016年 满孝意. All rights reserved.
//

// MARK:- 流程梳理
/**
 * 1. 封装 PageTitleView
 *    • 自定义View，并且自定义构造函数
 *    • 添加子控件：1>UIScrollView  2>设置TitleLabel  3>设置顶部的线段
 *
 * 2. 封装 PageContentView
 *    • 自定义View，并且自定义构造函数
 *    • 添加子控件：1>UICollectionView  2>给UICollectionView设置内容
 *
 * 3. 处理 PageTitleView & PageContentView的逻辑
 *    1. PageTitleView发生点击
 *        • 将PageTitleView中逻辑进行处理
 *        • 告知PageContentView滚动到正确的控制器
 *    2. PageContentView的滚动
 *        •
 *        •
 */

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    fileprivate lazy var pageContentView: PageContentView = {[weak self] in
        // 1. 设置frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2. 设置所有控制器
        var childVCs = [UIViewController]()
        for _ in 1...4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        
        // 闭包 防止循环引用 [weak self] in
        let pageContentView = PageContentView(frame: frame, childVCs: childVCs, parentViewController: self)
        pageContentView.delegate = self
        return pageContentView
        }()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
    
}

// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        // 0. 不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1. 设置导航栏
        setupNavigationBar()
        
        // 2. 添加TitleView
        view.addSubview(pageTitleView)
        
        // 3. 添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
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

// MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex: Int) {
        pageContentView.setCurrentIndex(selectedIndex)
    }
}

extension HomeViewController: PageContentViewDelegate {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}





