//
//  PlenyInterviewTaskApp.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI

@main
struct PlenyInterviewTaskApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
