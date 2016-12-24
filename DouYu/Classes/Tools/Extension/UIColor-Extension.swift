//
//  UIColor-Extension.swift
//  DouYu
//
//  Created by 满孝意 on 2016/12/23.
//  Copyright © 2016年 满孝意. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
