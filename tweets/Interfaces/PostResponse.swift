//
//  PostResponse.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import Foundation

struct PostResponse {
    let id: String
    let author: User
    let imageUrl: String
    let text: String
    let videoUrl: String
    let location: Location
    let hasVideo: boolean
    let hasImage: boolean
    let hasLocation: boolean
    let createAt: String
}
