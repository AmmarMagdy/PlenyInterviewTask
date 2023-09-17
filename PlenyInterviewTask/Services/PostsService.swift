//
//  PostsService.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Combine

protocol PostsServiceProtocol {
    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<PostsList, Error>
    func searchPosts(text: String) -> AnyPublisher<PostsList, Error>
    func savePosts(list: PostsList?)
    func getLocalPosts() -> AnyPublisher<[Post], Never>
}

class PostsService: PostsServiceProtocol {
    
    private let repository: PostsRepositoryProtocol
    private let dbRepository: PostsDBRepositoryProtocol

    init(repository: PostsRepositoryProtocol, dbRepository: PostsDBRepositoryProtocol) {
        self.repository = repository
        self.dbRepository = dbRepository
    }
    

    func fetchPosts(limit: Int, skip: Int) -> AnyPublisher<PostsList, Error> {
        return repository.fetchPosts(limit: limit, skip: skip)
            .eraseToAnyPublisher()
    }
    
    func searchPosts(text: String) -> AnyPublisher<PostsList, Error> {
        return repository.searchPosts(text: text).eraseToAnyPublisher()
    }
    
    func savePosts(list: PostsList?) {
        dbRepository.save(response: list)
    }
    
    func getLocalPosts() -> AnyPublisher<[Post], Never> {
        dbRepository.getPosts()
    }
}
