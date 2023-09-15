//
//  LoginRepository.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import Combine
import Foundation

protocol LoginRepositoryProtocol {
    func login(userName: String, password: String) -> AnyPublisher<User, Error>
}

class LoginRepository: LoginRepositoryProtocol {
    
    let apiClient: URLSessionAPIClient
    
    init(apiClient: URLSessionAPIClient) {
        self.apiClient = apiClient
    }
    
    func login(userName: String, password: String) -> AnyPublisher<User, Error> {
        return apiClient.request(Endpoint.login(userName: userName, password: password))
            .eraseToAnyPublisher()
    }
}
