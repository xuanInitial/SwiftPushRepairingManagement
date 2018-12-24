//
//  UserdefaultsData.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation



extension UserDefaults {

    // 第一次启动App
    struct JudgeFirst: UserDefaultsSettable {
        enum defaultKeys: String {
            case PushRepairingManagementFirst
        }
    }
    
    // 线索管理筛选
    struct Screening: UserDefaultsSettable {
        enum defaultKeys: String {
            case ScreeningCondition
            case ScreeningType
        }
    }
    
    
}
