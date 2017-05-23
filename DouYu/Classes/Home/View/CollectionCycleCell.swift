//
//  CollectionCycleCell.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/23.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK:- 定义模型属性
    var cycleModel: CycleModel? {
        didSet {
            // 0. 校验模型是否有值
            guard let cycleModel = cycleModel else { return }
            
            // 1. 显示标题
            titleLabel.text = cycleModel.title
            
            // 2. 设置图片
            guard let iconURL = NSURL(string: cycleModel.pic_url ) else { return }
            iconImageView.kf.setImage(with: ImageResource(downloadURL: iconURL as URL), placeholder: UIImage(named: "Img_default"))
        }
    }
    
}
