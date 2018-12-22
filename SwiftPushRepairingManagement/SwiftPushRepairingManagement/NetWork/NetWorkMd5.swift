//
//  NetWorkMd5.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/22.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation
import UIKit
import CommonCrypto

extension String {
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
}

extension String {
    
    func getUUID()->String{
        
        
        let UUIDDate = SSKeychain.passwordData(forService: "com.91bihu.SwiftPushRepairingManagement", account: "com.91bihu.SwiftPushRepairingManagement")
        
        
        var UUID : NSString!
        
        if UUIDDate != nil{
            
            UUID = NSString(data: UUIDDate!, encoding: String.Encoding.utf8.rawValue)
        }
        
        
        if(UUID == nil){
            
            UUID = UIDevice.current.identifierForVendor?.uuidString as NSString?
            
            
            SSKeychain.setPassword(UUID! as String, forService: "com.91bihu.SwiftPushRepairingManagement", account: "com.91bihu.SwiftPushRepairingManagement")
            
        }
        return UUID as String
    }

}
