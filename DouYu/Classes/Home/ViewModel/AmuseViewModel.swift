//
//  AmuseViewModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/27.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class AmuseViewModel: BaseViewModel {
    
}

extension AmuseViewModel {
    // http://capi.douyucdn.cn/api/v1/getHotRoom/2
    func loadAmuseData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
