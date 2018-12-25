//
//  MyService.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation
import Moya

enum NetAPIManager {
    case PostLogin(parameters:[String :Any]) //登录
    case PostGetMessageList(parameters:[String :Any]) //获取消息列表
    case PostGrabOrder(parameters:[String :Any]) //抢单
}

// MARK: - TargetType Protocol Implementation
extension NetAPIManager: TargetType {
    
    var baseURL: URL { return URL(string: BaseUrl)! }
    var path: String {
        switch self {
        case .PostLogin(parameters: _):
            
            return "Accident/Login"
        case .PostGetMessageList(parameters:_):
           return "Accident/GetMessage"
        case .PostGrabOrder(parameters:_):
            return "Accident/GrabOrder"
            
        }
    }
    var method: Moya.Method {
        switch self {
//        case :
//            return .get
        case .PostLogin,.PostGetMessageList,.PostGrabOrder:
            return .post
        }
    }
    var task: Task {
        
         return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
//        switch self {
//        case .PostLogin, .PostGetMessageList, .PostGrabOrder: // Send no parameters
//            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
//
        
//        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
//    }

        
    }
    //MARK -单元测试
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    var headers: [String: String]? {
    //return ["Content-type": "application/json"]
       return ["Content-Type" : "application/x-www-form-urlencoded"]
    }
    var parameters: [String: Any]?{
        
        switch self {
        case .PostLogin(parameters: var dic ):
            
            let uuid = String()
            dic.updateValue(uuid.getUUID().md5(), forKey: "CustKey")
            dic.updateValue("iOS", forKey: "LoginType")
           
          let temp = refineUsrWithDic(tempDic: dic)
            
            return temp
        default:
            
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {//编码的格式
        switch self {
        case .PostLogin(parameters: _):
            return URLEncoding.default
        default:
            return URLEncoding.default
        }
        
    }
}



// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


//MARK: - 生成 SecCode
func refineUsrWithDic(tempDic:[String:Any]) -> [String :Any] {
    
    var dic = tempDic
    
    let sckode = dictionaryUsrToMD5(dic: tempDic);
    
    dic.updateValue(sckode, forKey: "SecCode")
    
    return dic
}

//MARK: - md5加班
func dictionaryUsrToMD5(dic:[String:Any]) -> String {
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



//// MARK: - 设置请求头部信息
//let EndpointClosure = { (target: NetAPIManager) -> Endpoint in
//
//    let sessionId =  ""
//    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
//
//    let endpoint = Endpoint.init(url: url, sampleResponseClosure:  { .networkResponse(200, target.sampleData) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
//
//    return endpoint.adding(newHTTPHeaderFields: [
//        "Content-Type" : "application/x-www-form-urlencoded",
//        "COOKIE" : "JSESSIONID=\(sessionId)",
//        "Accept": "application/json;application/octet-stream;text/html,text/json;text/plain;text/javascript;text/xml;application/x-www-form-urlencoded;image/png;image/jpeg;image/jpg;image/gif;image/bmp;image/*"
//        ])
//}
//
//// MARK: - 设置请求超时时间
//let requestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<NetAPIManager>.RequestResultClosure) in
//
//    do {
//        var request: URLRequest = try endpoint.urlRequest()
//        request.timeoutInterval = 180    //设置请求超时时间
//        done(.success(request))
//    } catch  {
//        print("错误了 \(error)")
//    }
//}


