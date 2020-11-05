//
//  Register.swift
//  GenericAPI
//
//  Created by Ebrahim  Mo Gedamy on 10/23/20.
//

import Foundation

// MARK: - Register
struct Register: Codable {
    let key, value, msg: String
    let data: RegisterData
}

// MARK: - RegisterData
struct RegisterData: Codable {
    let userID: Int
    let vCode: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case vCode = "v_code"
    }
}
