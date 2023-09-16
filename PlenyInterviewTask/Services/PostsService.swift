//
//  PostsService.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Combine

protocol PostsServiceProtocol {
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<Posts, Error>
}

class PostsService: PostsServiceProtocol {
    
    private let repository: PostsRepository
    
    init(repository: PostsRepository) {
        self.repository = repository
    }
    
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<Posts, Error> {
        return repository.fetchPosts(limit: limit, skip: skip)
            .eraseToAnyPublisher()
    }
}
