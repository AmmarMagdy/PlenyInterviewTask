//
//  LoginViewModel.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 15/09/2023.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    
    let service: LoginServiceProtocol
    var cancellables = Set<AnyCancellable>()
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var showProgressView: Bool = false

    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func login() {
        showProgressView = true
        service.login(userName: userName, password: password)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.showProgressView = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Failed to fetch user: \(error)")
                }
            } receiveValue: { user in
                print(user)
            }.store(in: &cancellables)
    }
    
    func validateForm() -> Bool {
        if userName.isEmpty || password.isEmpty {
            errorMessage = "Please Enter Valid Username or Password"
            showAlert = true
          return false
        }
        return true
      }
}
