//
//  RobbingMessageList.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2019/1/4.
//  Copyright © 2019 initial. All rights reserved.
//

import UIKit
import HandyJSON

class RobbingMessageList: HandyJSON {

    var CuleId : Int?
    var SourceName : String?
    var Tip : String?
    var IsMany : Int?
    var IsDrivering : Int?
    
    var BrandName : String?
    
    var LicenseNo : String?
    var CarOwner : String?
    var OrderNum : String?
   
    var SourceId : Int?
    var MesaageType : Int?
    
    required init() {}
}
