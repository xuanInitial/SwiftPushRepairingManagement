//
//  BaseModel.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2019/1/5.
//  Copyright © 2019 initial. All rights reserved.
//

import Foundation

import Foundation
import HandyJSON


class BaseModel : HandyJSON{
    
    var Code : String?
    var Data : [String :Any]?
    var Message : String?
    
    
    required init() {}
    
}
