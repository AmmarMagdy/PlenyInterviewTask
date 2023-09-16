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
    case getPosts(limit: Int, skip: Int)
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .getPosts:
            return "posts"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getPosts:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login, .getPosts:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let userName, let password):
            return ["username": userName,
                    "password": password]
        default:
            return nil
        }
        
    }
    
    var queryParameter: [String: Any]? {
        switch self {
        case .getPosts(let limit, let skip):
            return ["limit": limit,
                    "skip": skip]
        default:
            return nil
        }
    }
}
