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
    class func requestData(type: MethodType, URLStr: String, params: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
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
            finishedCallback(result)
            
            // 5. 输出
//            guard let paramDict = params else {
//                return
//            }
//            var paramStr = ""
//            var index = 0
//            for (key, value) in paramDict {
//                index += 1
//                paramStr.append(key + "=" + value)
//                
//                if index != paramDict.count {
//                    paramStr.append("&")
//                }
//            }
//            
//            print("------------------------------------------------------------>")
//            print(URLStr + "?" + paramStr)
//            print("<------------------------------------------------------------>")
//            print(getJSONStrFromDict(dict: result as! NSDictionary))
//            print("<------------------------------------------------------------\n")
        }
    }
}

// MARK:- 字典转换为JSONString
func getJSONStrFromDict(dict: NSDictionary) -> String {
    if (!JSONSerialization.isValidJSONObject(dict)) {
        print("无法解析出JSONString")
        return ""
    }
    
    let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    let JsonString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue)
    return JsonString! as String
}

// MARK:- JSONString转换为字典
func getDictFromJSONStr(jsonStr:String) ->NSDictionary {
    let jsonData:Data = jsonStr.data(using: .utf8)!
    
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    guard let reuslt = dict else {
        return NSDictionary()
    }
    
    return reuslt as! NSDictionary
}
