//
//  User.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let username, email, firstName, lastName, gender, image, token: String
}
