//
//  PostsRepository.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Combine

protocol PostsRepositoryProtocol {
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<PostsList, Error>
    func searchPosts(text: String) -> AnyPublisher<PostsList, Error>
}

class PostsRepository: PostsRepositoryProtocol {
    
    let apiClient: URLSessionAPIClient
    
    init(apiClient: URLSessionAPIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<PostsList, Error> {
        return apiClient.request(Endpoint.getPosts(limit: limit, skip: skip))
            .eraseToAnyPublisher()
    }
    
    func searchPosts(text: String) -> AnyPublisher<PostsList, Error> {
        return apiClient.request(Endpoint.searchPosts(text: text)).eraseToAnyPublisher()
    }
}
