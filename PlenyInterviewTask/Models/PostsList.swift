//
//  PostsList.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Foundation

struct PostsList: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}
