//
//  ServicesContainer.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 15/09/2023.
//

import Foundation

extension DIContainer {
    
    struct Services {
        
        let loginService: LoginServiceProtocol
        
        init(loginService: LoginServiceProtocol) {
            self.loginService = loginService
        }
    }
    
    struct ViewModels {
        
        let loginViewModel: LoginViewModel

        init(loginViewModel: LoginViewModel) {
            self.loginViewModel = loginViewModel
        }
    }
}
