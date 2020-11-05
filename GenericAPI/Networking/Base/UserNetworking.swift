//
//  UserNetworking.swift
//  GenericAPI
//
//  Created by Ebrahim  Mo Gedamy on 10/23/20.
//

import Foundation
import Alamofire

/// To handling api-services
enum UsersNetworking {
    case Login(lang: String ,isoID: Int, phone:String, password: String, deviceID: String, deviceType: String)
    case Register(name: String, email : String ,lang: String, isoID: Int, phone:String, password: String, deviceID: String, deviceType: String)
}

extension UsersNetworking: TargetType {
    
    var baseURL: String {
        return "https://asiaspa.aait-sa.com/api/"
    }
    
    var path: String {
        switch self {
        case .Login:
            return "login"
        case .Register:
            return "register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Login:
            return .post
        case .Register:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .Login(let lang, let isoID, let phone, let password, let deviceID, let deviceType):
            return .requestParameters(parameters: ["iso_id":isoID,"phone":phone,"password":password,"device_id":deviceID,"device_type":deviceType,"lang":lang], encoding: JSONEncoding.default)
        case .Register(let name, let email, let lang, let isoID, let phone, let password, let deviceID, let deviceType):
            return .requestParameters(parameters: ["email":email,"name":name,"iso_id":isoID,"phone":phone,"password":password,"device_id":deviceID,"device_type":deviceType,"lang":lang], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
