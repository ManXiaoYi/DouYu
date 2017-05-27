//
//  GameViewModel.swift
//  DouYu
//
//  Created by 满孝意 on 2017/5/27.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games: [GameModel] = [GameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback: @escaping () -> ()) {
        // http://capi.douyucdn.cn/api/v1/getColumnDetail?shortName=game
        NetworkTools.requestData(.get, URLStr: "http://capi.douyucdn.cn/api/v1/getColumnDetail", params: ["shortName": "game"]) { (result) in
            // 1. 获取到数据
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            
            // 2. 字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            
            // 3. 完成回调
            finishedCallback()
        }
    }
}
