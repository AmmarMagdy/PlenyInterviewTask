//
//  AppEnvironment.swift
//  CountriesSwiftUI
//
//  Created by Alexey Naumov on 09.11.2019.
//  Copyright © 2019 Alexey Naumov. All rights reserved.
//

import Combine
import Foundation


struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    
    static func bootstrap() -> AppEnvironment {
        let apiClient = URLSessionAPIClient()
        let webRepositories = configuredWebRepositories(apiClient: apiClient)
        let services = configuredServices(webRepositories: webRepositories)
        let viewModels = configuredViewModels(services: services)
        let diContainer = DIContainer(services: services, viewModels: viewModels)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredWebRepositories(apiClient: URLSessionAPIClient) -> DIContainer.WebRepositories {
        let loginRepository = LoginRepository(apiClient: apiClient)
        let postsRepository = PostsRepository(apiClient: apiClient)
        return .init(loginRepository: loginRepository, postsRepository: postsRepository)
    }
    
    private static func configuredServices(webRepositories: DIContainer.WebRepositories) -> DIContainer.Services {
        let loginService = LoginService(repository: webRepositories.loginRepository)
        let postsService = PostsService(repository: webRepositories.postsRepository)
        return .init(loginService: loginService, postsService: postsService)
    }
    
    private static func configuredViewModels(services: DIContainer.Services) -> DIContainer.ViewModels {
        let loginViewModel = LoginViewModel(service: services.loginService)
        let postsViewModel = PostsViewModel(service: services.postsService)
        return .init(loginViewModel: loginViewModel, postsViewModel: postsViewModel)
    }
}

extension DIContainer {
    struct WebRepositories {
        let loginRepository: LoginRepositoryProtocol
        let postsRepository: PostsRepositoryProtocol
    }
}
