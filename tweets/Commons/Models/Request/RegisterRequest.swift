//
//  RegisterRequest.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import Foundation

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let names: String
}
