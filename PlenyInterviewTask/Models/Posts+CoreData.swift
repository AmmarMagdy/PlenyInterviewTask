//
//  Posts+CoreData.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 17/09/2023.
//

import CoreData

extension Post {
    
    func store() {
        let post = NSEntityDescription
            .insertNewObject(forEntityName: "PostMO", into: PersistentStore.shared.context)
        post.setValue(Int32(id), forKey: "id")
        post.setValue(title, forKey: "title")
        post.setValue(body, forKey: "body")
        post.setValue(Int32(userId), forKey: "userId")
        post.setValue(Int32(reactions), forKey: "reactions")
        PersistentStore.shared.saveContext()
    }
    
    init?(managedObject: PostMO?) {
        guard let managedObject = managedObject, let title = managedObject.title, let body = managedObject.body else { return nil }
        self.init(id: Int(managedObject.id),
                  title: title,
                  body: body,
                  userId: Int(managedObject.userId),
                  reactions: Int(managedObject.reactions),
                  tags: nil)
        
    }
}
