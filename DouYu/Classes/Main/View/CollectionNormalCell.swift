//
//  CollectionViewNormalCell.swift
//  DouYu
//
//  Created by 满孝意 on 2017/4/13.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var roomNameLabel: UILabel!
    
    // MARK:- 定义模型属性
    override var anchor: AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            
            // 2. 房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }
    
}
