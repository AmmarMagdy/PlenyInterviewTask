//
//  LoginService.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 15/09/2023.
//

import Combine

protocol LoginServiceProtocol {
    func login(userName: String, password: String) -> AnyPublisher<User, Error>
}

class LoginService: LoginServiceProtocol {
    
    private let repository: LoginRepositoryProtocol
    
    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }
    
    func login(userName: String, password: String) -> AnyPublisher<User, Error> {
        return repository.login(userName: userName, password: password)
            .eraseToAnyPublisher()
    }
}
