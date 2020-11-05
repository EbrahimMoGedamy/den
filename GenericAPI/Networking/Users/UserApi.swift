//
//  UserApi.swift
//  GenericAPI
//
//  Created by Ebrahim  Mo Gedamy on 10/23/20.
//

import Foundation
protocol UsersAPIProtocol {
    func didLogined(completion: @escaping (Result<Login?, NSError>) -> Void)
}

class UserApi: Api<UsersNetworking> ,UsersAPIProtocol{
    
    func didLogined(completion: @escaping (Result<Login?, NSError>) -> Void) {
        self.fetchData(target: .Login(lang: "en", isoID: 2, phone: "1020140743", password: "1234567", deviceID: "ewqqweqw", deviceType: "android"), responseClass: Login.self) { (response) in
            completion(response)
        }
    }
    
    
}
