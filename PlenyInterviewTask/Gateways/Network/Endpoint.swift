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
    var queryParameter: [URLQueryItem]? { get }
}

enum Endpoint: APIEndpoint {
    
    case login(userName: String, password: String)
    case getPosts(limit: Int, skip: Int)
    case searchPosts(text: String)
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .getPosts:
            return "posts"
        case .searchPosts:
            return "posts/search"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getPosts, .searchPosts:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login, .getPosts, .searchPosts:
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
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getPosts(let limit, let skip):
            return [
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "skip", value: "\(skip)")
            ]
            
        case .searchPosts(let text):
            return [
                URLQueryItem(name: "q", value: "\(text)"),
            ]
            
        default:
            return nil
        }
    }
}
