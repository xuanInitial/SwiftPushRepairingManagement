//
//  UserdefaultsData.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}
extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}

extension UserDefaultsSettable where defaultKeys.RawValue==Bool{
    static func set(value: Bool?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: String(aKey))
    }
    static func string(forKey key: defaultKeys) -> Bool? {
        let aKey = key.rawValue
        return UserDefaults.standard.bool(forKey: String(aKey))
    }
}

extension UserDefaultsSettable where defaultKeys.RawValue==Int{
    static func set(value: Int?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: String(aKey))
    }
    static func string(forKey key: defaultKeys) -> Int? {
        let aKey = key.rawValue
        return UserDefaults.standard.integer(forKey: String(aKey))
    }
}



