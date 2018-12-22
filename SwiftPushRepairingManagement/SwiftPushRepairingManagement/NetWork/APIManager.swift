//
//  APIManager.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/21.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

import UIKit
import Alamofire



enum MethodType {
    case GET
    case POST
}





class APIManager: NSObject {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
    
    class func loginRequestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        var tempDic = parameters
        
        let uuid = String()
       tempDic?.updateValue(uuid.getUUID().md5(), forKey: "CustKey")
        tempDic?.updateValue("iOS", forKey: "LoginType")
        
        let parameter = self.refineUsrWithDic(tempDic: tempDic!)
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameter).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }

    
 //MARK: - 生成 SecCode
  class  func refineUsrWithDic(tempDic:[String:Any]) -> [String :Any] {
        
         var dic = tempDic
    
    let sckode = self.dictionaryUsrToMD5(dic: tempDic);
    
        dic.updateValue(sckode, forKey: "SecCode")
    
        return dic
    }

    //MARK: - md5加班
  class  func dictionaryUsrToMD5(dic:[String:Any]) -> String {
    var temdic = dic
        temdic.updateValue("55e8e155-bd5b-49da-93f1-ba8acd9e9448", forKey: "KeyCode")
    let sortedKeys = temdic.keys.sorted { (first, sender) -> Bool in
        return first < sender  //排序 A~Z
    }
    var queryStr = String()
    for  aKey  in sortedKeys {
        
        let value = temdic["\(aKey)"]
        
        let key = "\(aKey)" + "=" + "\(value ?? "")"
        
        queryStr.append(key)
        queryStr.append("&")
    }
        return String(queryStr.prefix(queryStr.count-1)).md5()
    }
    
    
    
}



