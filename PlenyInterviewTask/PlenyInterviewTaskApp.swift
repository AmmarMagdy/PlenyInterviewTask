//
//  PlenyInterviewTaskApp.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI

@main
struct PlenyInterviewTaskApp: App {
    
    var body: some Scene {

        WindowGroup {
            LoginCoordinator().view()
        }
    }
}
