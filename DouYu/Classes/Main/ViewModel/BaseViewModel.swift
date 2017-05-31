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
    func loadAnchorData(URLString: String, params: [String: Any]? = nil, finishedCallback: @escaping () -> ()) {
        NetworkTools.requestData(.get, URLStr: URLString) { (result) in
            // 1. 获取到数据
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            
            // 2. 字典转模型
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            
            // 3. 完成回调
            finishedCallback()
        }
    }
}
