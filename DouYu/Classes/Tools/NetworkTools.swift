//
//  NetworkTools.swift
//  DouYu
//
//  Created by 满孝意 on 2017/4/13.
//  Copyright © 2017年 满孝意. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(type: MethodType, URLStr: String, params: [String: String]? = nil, finishedCallback: @escaping (_ result: AnyObject) -> ()) {
        // 1. 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        // 2. 发送网络请求
        Alamofire.request(URLStr, method: method, parameters: params).responseJSON { (response) in
            
            // 3. 获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4. 结果回调
            finishedCallback(result as AnyObject)
        }
    }
}
