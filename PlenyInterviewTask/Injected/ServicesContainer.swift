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
        let postsService: PostsServiceProtocol

        init(loginService: LoginServiceProtocol, postsService: PostsServiceProtocol) {
            self.loginService = loginService
            self.postsService = postsService
        }
    }
    
    struct ViewModels {
        
        let loginViewModel: LoginViewModel
        let postsViewModel: PostsViewModel

        init(loginViewModel: LoginViewModel, postsViewModel: PostsViewModel) {
            self.loginViewModel = loginViewModel
            self.postsViewModel = postsViewModel
        }
    }
}
