//
//  BaseGameModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/27.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    // 组显示的标题
    var tag_name: String = ""
    // 游戏对应的图标
    var icon_url: String = ""
    
    // MARK:- 构造函数
    override init() {
        
    }
    
    // MARK:- 自定义构造函数
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
