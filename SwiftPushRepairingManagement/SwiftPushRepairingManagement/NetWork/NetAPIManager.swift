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
    
    case PostSaveJgAccount(parameters:[String :Any]) //保存代理人和极光账户关系
    case PostGetAccidentClueTotalCout(parameters:[String :Any]) // 获取线索管理总数
    case PostGetAccidentClue(parameters:[String :Any]) //线索列表+搜索
    
    case GetNewTGetReInfo(parameters:[String :Any]) //续保
    case PostGetClusDetails(parameters:[String :Any]) //获取线索详情
    case PostDelAppClue(parameters:[String :Any]) //删除线索
    
    case PostGetSmsTemplateList(parameters:[String :Any]) //获取短信模板
    case PostSendMessage(parameters:[String :Any]) //跟进记录发送短信
    case PostGetFollowUpStatesV2(parameters:[String :Any]) //获取跟进状态
    
    case PostGetLossReasons(parameters:[String :Any]) //流失原因
    case PostGetRecivesCarPeoples(parameters:[String :Any]) //获取顶级代理人下所有接车人
    case PostInputFollowUp(parameters:[String :Any]) //录入跟进
    
    case PostEditClueInfo(parameters:[String :Any]) //编辑线索
    case PostGetClueParam(parameters:[String :Any]) //获取保险公司和案件类型
    case PostIsCanFollow(parameters:[String :Any]) //线索是否可以跟进
    
    case PostUploadImg(parameters:[String :Any]) //跟进上图片
    case PostGetStatisticsInfo(parameters:[String :Any]) //获取个人中心统计信息
    case PostCompareVersion(parameters:[String :Any]) //版本号比较
    
    case PostSignOut(parameters:[String :Any]) // 退出
    case PostAddClues(parameters:[String :Any]) //新增线索
    case PostExitCallPhone(parameters:[String :Any]) //打电话校验
    
}

// MARK: - TargetType Protocol Implementation
extension NetAPIManager: TargetType {
    
    var baseURL: URL { return URL(string: BaseUrl)! }
    var path: String {
        switch self {
        case .PostLogin( _):
            
            return "Accident/Login"
        case .PostGetMessageList( _):
           return "Accident/GetMessage"
        case .PostGrabOrder(_):
            return "Accident/GrabOrder"
            
        case .PostSaveJgAccount( _):
            return "Accident/SaveJgAccount"
        case .PostGetAccidentClueTotalCout( _):
            return "Accident/GetAccidentClueTotalCout"
        case .PostGetAccidentClue( _):
            return "Accident/GetAccidentClue"
        case .GetNewTGetReInfo( _):
            return "Accident/TGetReInfo"
        case .PostGetClusDetails( _):
            return "Accident/GetClusDetails"
        case .PostDelAppClue( _):
            return "Accident/DelAppClue"
        case .PostGetSmsTemplateList( _):
            return "Accident/GetSmsTemplateList"
        case .PostSendMessage( _):
            return "Accident/SendMessage"
        case .PostGetFollowUpStatesV2( _):
            return "Accident/GetFollowUpStatesV2"
        case .PostGetLossReasons( _):
            return "Accident/GetLossReasons"
        case .PostGetRecivesCarPeoples( _):
            return "Accident/GetRecivesCarPeoples"
        case .PostInputFollowUp( _):
            return "Accident/InputFollowUp"
        case .PostEditClueInfo( _):
            return "Accident/EditClueInfo"
        case .PostGetClueParam( _):
            return "Accident/GetClueParam"
        case .PostIsCanFollow( _):
            return "Accident/IsCanFollow"
        case .PostUploadImg( _):
            return "Accident/UploadImg"
        case .PostGetStatisticsInfo( _):
            return "Accident/GetStatisticsInfo"
        case .PostCompareVersion( _):
            return "Accident/CompareVersion"
        case .PostSignOut( _):
            return "Accident/SignOut"
        case .PostAddClues( _):
            return "Accident/AddClues"
        case .PostExitCallPhone( _):
            return "Accident/ExitCallPhone"
        }
    }
    var method: Moya.Method {
        switch self {

        case .GetNewTGetReInfo:
            return .get
            
        default:
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
        case .PostGetMessageList(parameters: var dic) , .PostSignOut(parameters: var dic):
            
         //    let userData = UserData.readUserInfo()
             dic.updateValue("iOS", forKey: "LoginType")
             
            let temp = refineUsrWithDic(tempDic: addPublicParameters(dic))
            
            return temp
        default :
            
            let userData = UserData.readUserInfo()
            
            print(userData.Token as Any)
            
            
            
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


func addPublicParameters(_ parmDic: [String:Any]) -> [String:Any] {
    let user: LoginData! = UserData.readUserInfo()
    var parameters = parmDic
   
    parameters.updateValue(user.AgentId!, forKey: "AgentId")
    
     parameters.updateValue(user.TopAgentId!, forKey: "TopAgentId")
    
     parameters.updateValue(user.Token!, forKey: "Token")
    
    return parameters
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


