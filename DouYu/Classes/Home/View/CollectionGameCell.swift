//
//  CollectionGameCell.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/24.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK:- 定义模型属性
    var group: AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            
            if let iconURL = URL(string: group?.icon_url ?? "") {
                iconImageView.kf.setImage(with: ImageResource(downloadURL: iconURL as URL))
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }
    
}
