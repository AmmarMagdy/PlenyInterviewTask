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
        let diContainer = DIContainer(services: services)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredWebRepositories(apiClient: URLSessionAPIClient) -> DIContainer.WebRepositories {
        let loginRepository = LoginRepository(apiClient: apiClient)
        return .init(loginRepository: loginRepository)
    }
    
    private static func configuredServices(webRepositories: DIContainer.WebRepositories) -> DIContainer.Services {
        let loginService = LoginService(repository: webRepositories.loginRepository)
        return .init(loginService: loginService)
    }
}

extension DIContainer {
    struct WebRepositories {
        let loginRepository: LoginRepositoryProtocol
    }
}
