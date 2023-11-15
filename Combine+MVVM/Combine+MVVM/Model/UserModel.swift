//
//  UserModel.swift
//  Combine+MVVM
//
//  Created by Fazil P on 06/11/2023.
//

import Foundation

struct UserModel: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat, lng: String?
}

struct Company: Codable {
    let name: String?
}

typealias User = [UserModel]







