//
//  PostsRepository.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Combine

protocol PostsRepositoryProtocol {
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<Posts, Error>
}

class PostsRepository: PostsRepositoryProtocol {
    
    let apiClient: URLSessionAPIClient
    
    init(apiClient: URLSessionAPIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<Posts, Error> {
        return apiClient.request(Endpoint.getPosts(limit: limit, skip: skip))
            .eraseToAnyPublisher()
    }
}
