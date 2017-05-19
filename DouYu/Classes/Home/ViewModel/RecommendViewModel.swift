//
//  RecommendViewModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/4/13.
//  Copyright © 2017年 满孝意. All rights reserved.
//

/*
 1> 请求0/1数组,并转成模型对象
 2> 对数据进行排序
 3> 显示的HeaderView中内容
 */

import UIKit

class RecommendViewModel {
    // MARK:- 懒加载属性
    lazy var archorGroups: [AnchorGroup] = [AnchorGroup]()
    fileprivate lazy var bigDataGroup: AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup: AnchorGroup = AnchorGroup()
}

// MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData(finishCallback: @escaping () -> ()) {
        // 1. 定义参数
        let params = ["limit": "4", "offset": "0", "time": NSDate.getCurrentTime()]
        
        
        // 2. 创建Group
        let disGroup = DispatchGroup()
        
        
        // 3. 请求第一部分推荐数据
        disGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getbigDataRoom?time=1474252024
        NetworkTools.requestData(type: .GET, URLStr: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", params: ["time": NSDate.getCurrentTime()]) { (result) in
            // 1. 将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2. 根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3. 遍历字典,并且转成模型对象
            // 3.1 设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            // 3.3 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            // 3.4 离开组
            disGroup.leave()
            print("请求到0组数据")
        }
        
        
        // 4. 请求第二部分颜值数据
        disGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&offset=0&time=1474252024
        NetworkTools.requestData(type: .GET, URLStr: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", params: params) { (result) in
            // 1. 将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2. 根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3. 遍历字典,并且转成模型对象
            // 3.1 设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            // 3.3 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            
            // 3.4 离开组
            disGroup.leave()
            print("请求到1组数据")
        }
        
        
        // 5. 请求后面部分游戏数据
        disGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1474252024
        NetworkTools.requestData(type: .GET, URLStr: "http://capi.douyucdn.cn/api/v1/getHotCate", params: params) { (result) in
            // 1. 将result转换成字典
            guard let resultDict = result as? [String: NSObject] else { return }
            
            // 2. 根据data的key，获取数组
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            
            // 3. 遍历数组，将字典转成模型对象
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                self.archorGroups.append(group)
            }
            
            // 4. 离开组
            disGroup.leave()
            print("请求到2~12组数据")
        }
        
        
        // 6. 所有的数据都请求到，然后排序
        disGroup.notify(queue: DispatchQueue.main) {
            print("所有的数据都请求到")
            self.archorGroups.insert(self.prettyGroup, at: 0)
            self.archorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }
    }
}
