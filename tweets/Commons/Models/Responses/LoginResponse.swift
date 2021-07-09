//
//  LoginResponse.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import Foundation

struct LoginResponse: Codable {
    let user: User
    let token: String
}
