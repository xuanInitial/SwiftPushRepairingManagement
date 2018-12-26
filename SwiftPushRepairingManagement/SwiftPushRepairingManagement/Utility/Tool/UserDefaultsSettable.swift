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
    
    
    static func set(_ value: Bool, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func bool(forKey key: defaultKeys) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    
    
    static func set(_ value: Int, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func integer(forKey key: defaultKeys) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    
    
    static func set(_ value: Float, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func float(forKey key: defaultKeys) -> Float {
        return UserDefaults.standard.float(forKey: key.rawValue)
    }
    
    
    
    static func set(_ value: Double, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func double(forKey key: defaultKeys) -> Double {
        return UserDefaults.standard.double(forKey: key.rawValue)
    }
    
    
    static func set(_ value: URL?, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func url(forKey key: defaultKeys) -> URL? {
        return UserDefaults.standard.url(forKey: key.rawValue)
    }
    
    
    
    static func set(_ value: Any?, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func object(forKey key: defaultKeys) -> Any? {
        return UserDefaults.standard.object(forKey: key.rawValue)
    }
    
    static func set(_ value: Data?, forKey key: defaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func data(forKey key: defaultKeys) -> Data? {
        return UserDefaults.standard.data(forKey: key.rawValue)
    }
    
    
    
//    static func set<T: Encodable>(model: T?, forKey key: defaultKeys) {
//        UserDefaults.standard.set(model: model, forKey: key)
//
//    }
//
//    static func model<T: Decodable>(forKey key: defaultKeys) -> T? {
//        return UserDefaults.standard.model(forKey: key.rawValue)
//    }
    
    /// remove
    static func remove(forKey key: defaultKeys){
        return UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    

    
    
}







