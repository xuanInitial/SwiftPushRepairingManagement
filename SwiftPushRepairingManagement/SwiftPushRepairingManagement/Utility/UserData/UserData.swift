//
//  UserData.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

//    var loginState = false /*登录状态 */
//    var user: UserInfo? /*登录用户 */
//    var userinfoArray: [UserInfo] = [] // 存储的登录用户

class UserData:NSObject{
    
   //  static let userData = UserData()
    
    
    
    class  func writeUserInfo(userData:String){
        
        UserDefaults.UserData.set(value: userData, forKey: .loginData)
        
    }
    
    class  func readUserInfo() -> (LoginData) {
        
     let str =  UserDefaults.UserData.string(forKey: .loginData)
        
        
        if let object = LoginRootClass.deserialize(from: str) {
        
            let  loginData = object.Data!
            
            return loginData
        }
        return LoginData();
        
    }
    
}






    






