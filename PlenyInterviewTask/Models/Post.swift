//
//  Post.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title, body: String
    let userId, reactions: Int
    let tags: [String]
}
