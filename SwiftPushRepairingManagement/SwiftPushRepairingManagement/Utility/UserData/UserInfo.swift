//
//  UserInfo.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

class UserInfo: NSObject, NSCoding, NSCopying {
    var account = ""
    var agentId: Int = 0
    var departmentId: Int = 0
    var name = ""
    var roleId: Int = 0
    var roleType: Int = 0
    var secretKey = ""
    var token = ""
    var topAgentId: Int = 0
    var cityId: Int = 0
    var roleName = ""
    /*角色名称 */    var functionCode: [Any] = []
    //角色权限数组
    
    func encode(with aCoder: NSCoder) {
        modelEncode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        modelInit(with: aDecoder)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return modelCopy() as Any
    }
    
    func hash() -> Int {
        return Int(modelHash())
    }
    
    func isEqual(_ object: Any) -> Bool {
        return modelIsEqual(object)
    }
    
    func description() -> String? {
        return modelDescription()
    }
}

