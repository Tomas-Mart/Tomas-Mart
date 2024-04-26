//
//  PostModel.swift
//  postsApp
//
//  Created by Amina TomasMart on 15.03.2024.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let postId: Int
    let title: String
    let subtitle: String
    
    enum CodingKeys: String, CodingKey {
        case userId, title
        case postId = "id"
        case subtitle = "body"
    }
}
