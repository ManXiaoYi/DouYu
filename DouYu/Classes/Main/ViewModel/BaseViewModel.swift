//
//  BaseViewModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/27.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData: Bool, URLString: String, params: [String: Any]? = nil, finishedCallback: @escaping () -> ()) {
        NetworkTools.requestData(.get, URLStr: URLString) { (result) in
            // 1. 获取到数据
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            
            // 2. 字典转模型
            if isGroupData {
                for dict in dataArray {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
            } else {
                // 2.1. 创建数组
                let group = AnchorGroup()
                
                // 2.2. 遍历dataArray的所有的字典
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                
                // 2.3. 将将group，添加到anchorGroups
                self.anchorGroups.append(group)
            }
            
            // 3. 完成回调
            finishedCallback()
        }
    }
}
