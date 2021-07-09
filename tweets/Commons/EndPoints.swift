//
//  EndPoints.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import Foundation

struct EndPoints {
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    
    static let login = EndPoints.domain + "/auth"
    static let register = EndPoints.domain + "/register"
    static let post = EndPoints.domain + "/posts"
}
