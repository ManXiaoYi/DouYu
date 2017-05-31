//
//  FunnyViewModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/31.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {
    
}

extension FunnyViewModel {
    // http://capi.douyucdn.cn/api/v1/getColumnRoom/3?limit=30&offset=0
    func loadFunnyData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", params: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallback)
    }
}
