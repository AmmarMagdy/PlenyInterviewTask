//
//  PostsViewModel.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import Combine
import Foundation
import Stinsen

class PostsViewModel: ObservableObject {
    
    private let service: PostsServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    @Published var showProgressView: Bool = false
    @Published var dataIsLoading = false
    @Published var items: [Post] = []
    
    private let limit = 15
    private var skip: Int = 0
    private var list: PostsList?
    
    
    init(service: PostsServiceProtocol) {
        self.service = service
    }
    
    func getPosts() {
        service.fetchPosts(limit: limit, skip: skip)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.showProgressView = false
                //TODO: handle skeleton apperance
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    //TODO: handel error
                    print("Failed to fetch user: \(error)")
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.list = response
                self.items.append(contentsOf: response.posts)
                self.dataIsLoading = false
            }.store(in: &cancellables)
    }
    
    func loadMoreContent(post: Post?) {
        guard let post = post else { return }
        if list?.posts.last?.id == post.id, let total = list?.total, (skip + limit) <= total {
            showProgressView = true
            skip += limit
            getPosts()
        }
    }
    
    func post(at index: Int) -> Post? {
        guard items.count > index else { return nil }
        return items[index]
    }
}

class PostViewModel: ObservableObject {
    
    @Published var post: Post?
    
    init(post: Post?) {
        self.post = post
    }
}
