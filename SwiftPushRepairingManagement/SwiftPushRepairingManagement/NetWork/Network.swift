//
//  Network.swift
//  SwiftPushRepairingManagement
//
//  Created by initial on 2018/12/24.
//  Copyright © 2018 initial. All rights reserved.
//

import Foundation

import ObjectMapper
import Moya
import RxSwift

struct HTTBin: Mappable {
    var origin: String = ""
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        origin <- map["origin"]
    }
}

enum HTTPBinServices {
    case get
    case origin
}
extension HTTPBinServices: TargetType {
    var baseURL: URL {
        return URL.get(string: "http://httpbin.org/")
    }
    var path: String {
        switch self {
        case .get: return "get"
        case .origin: return "ip"
        }
    }
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    var task: Task {
        return Task.requestPlain
    }
    var validationType: ValidationType {
        return .none
    }
    var headers: [String: String]? {
        return nil
    }
}

extension URL {
    static func get(string: String) -> URL {
        if string.count > 0, let url = URL(string: string) {
            return url
        }
        assert(string.count <= 0, "check the url (string = \(string)")
        return URL(string: string)!
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func map<T: BaseMappable>(_ type: T.Type) -> Single<T?> {
        return flatMap { response -> Single<T?> in
            do {
                let any = try response.mapJSON()
                guard let dic = any as? [String: Any] else {
                    return Single<T?>.just(nil)
                }
                let mapper = T(JSON: dic)
                return Single<T?>.just(mapper)
                
            } catch {
                return Single<T?>.just(nil)
            }
        }
    }
}

