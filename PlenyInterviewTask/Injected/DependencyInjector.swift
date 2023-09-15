//
//  DependencyInjector.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 15/09/2023.
//

import SwiftUI
import Combine

// MARK: - DIContainer

struct DIContainer {
    
    let services: Services
    
    init(services: DIContainer.Services) {
        self.services = services
    }

}

