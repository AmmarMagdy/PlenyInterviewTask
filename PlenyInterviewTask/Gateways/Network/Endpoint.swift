//
//  Endpoint.swift
//  Network
//
//  Created by Ammar.M on 14/09/2023.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum Endpoint: APIEndpoint {
    
    case login(userName: String, password: String) 
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let userName, let password):
            return ["username": userName,
                    "password": password]
        }
    }
}
