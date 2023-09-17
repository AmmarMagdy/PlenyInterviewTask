//
//  PostsDBRepository.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 17/09/2023.
//

import CoreData
import Combine

protocol PostsDBRepositoryProtocol {
    func getPosts() -> AnyPublisher<[Post], Never>
    func save(response: PostsList?)
}

struct PostsDBRepository: PostsDBRepositoryProtocol {
    
    func getPosts() -> AnyPublisher<[Post], Never> {
        Just(retrieveSavedUsers()).eraseToAnyPublisher()
    }
    
    func save(response: PostsList?) {
        deletePreviousRecords()
        response?.posts.forEach() { post in
            post.store()
        }
    }
    
    private func retrieveSavedUsers() -> [Post] {
        var retrievedPosts: [Post] = []
        let results = fetchResult()
        if !results.isEmpty {
            for result in results as! [NSManagedObject] {
                guard let post = Post(managedObject: result as? PostMO) else { return [] }
                retrievedPosts.append(post)
            }
        }
        return retrievedPosts
    }
    
    private func fetchResult() -> [NSFetchRequestResult] {
        let context = PersistentStore.shared.context
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PostMO")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print("Error retrieving: \(error)")
        }
        return []
    }
    
    private func deletePreviousRecords() {
        let context = PersistentStore.shared.context
        let results = fetchResult()
        for object in results {
            guard let objectData = object as? NSManagedObject else {continue}
            context.delete(objectData)
        }
    }
}
