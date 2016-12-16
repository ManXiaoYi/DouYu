//
//  UIBarButtonItem-Extension.swift
//  DouYu
//
//  Created by 满孝意 on 2016/11/21.
//  Copyright © 2016年 满孝意. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // 遍历构造函数
    // 1. convenience开头     2. 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        // 1. 创建UIButton
        let btn = UIButton()
        
        // 2. 设置btn的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3. 设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        // 4. 创建UIBarButtonItem
        self.init(customView: btn)
    }
}
