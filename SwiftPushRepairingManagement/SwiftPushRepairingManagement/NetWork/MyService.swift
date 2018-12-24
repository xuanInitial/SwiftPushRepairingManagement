//
//  MyService.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation
import Moya

enum MyService {
    case login(parameters:[String :Any])
    case showUser(id: Int)
//    case createUser(firstName: String, lastName: String)
//    case updateUser(id: Int, firstName: String, lastName: String)
//    case showAccounts
}

// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    var baseURL: URL { return URL(string: BaseUrl)! }
    var path: String {
        switch self {
        case .login(parameters: _):
            
            return PostLogin
       case .showUser(let id):
           return "/users/\(id)"
//        case .createUser(_, _):
//            return "/users"
//        case .showAccounts:
//            return "/accounts"
        }
    }
    var method: Moya.Method {
        switch self {
        case  .showUser:
            return .get
        case .login:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .login, .showUser: // Send no parameters
            return .requestPlain
//        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .login:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        case .showUser(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
//        case .createUser(let firstName, let lastName):
//            return "{\"id\": 100, \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
//        case .updateUser(let id, let firstName, let lastName):
//            return "{\"id\": \(id), \"first_name\": \"\(firstName)\", \"last_name\": \"\(lastName)\"}".utf8Encoded
//        case .showAccounts:
//            // Provided you have a file named accounts.json in your bundle.
//            guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json"),
//                let data = try? Data(contentsOf: url) else {
//                    return Data()
//            }
//            return data
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    var parameters: [String: Any]?{
        
        switch self {
        case .login(parameters: var dic ):
            
            let uuid = String()
            dic.updateValue(uuid.getUUID().md5(), forKey: "CustKey")
            dic.updateValue("iOS", forKey: "LoginType")
           
          let temp = refineUsrWithDic(tempDic: dic)
            
            return temp
        case .showUser(id: ):
            return nil
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
