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
    let viewModels: ViewModels
    
    init(services: DIContainer.Services, viewModels:  DIContainer.ViewModels) {
        self.services = services
        self.viewModels = viewModels
   }
}

