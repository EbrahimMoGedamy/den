//
//  Login.swift
//  GenericAPI
//
//  Created by Ebrahim  Mo Gedamy on 10/23/20.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let key, value : String?
    let data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    let id ,isoID: Int?
    let name ,avatar,iso, email, phoneWithoutISO, phone: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case isoID = "iso_id"
        case iso, email
        case phoneWithoutISO = "phone_without_iso"
        case phone, avatar
    }
}
