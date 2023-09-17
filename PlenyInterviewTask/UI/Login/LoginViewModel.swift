//
//  LoginViewModel.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 15/09/2023.
//

import Combine
import Foundation
import Stinsen

class LoginViewModel: ObservableObject {
    
    private let service: LoginServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var showProgressView: Bool = false
    
    @RouterObject var router: NavigationRouter<LoginCoordinator>!
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func login() {
        showProgressView = true
        service.login(userName: userName, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                //TODO: save token
                self.showProgressView = false
                switch completion {
                case .finished:
                    self.openTabs()
                case .failure(let error):
                    print("Failed to fetch user: \(error)")
                }
            } receiveValue: { user in
                print(user)
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
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
    
    func openTabs() {
        router.coordinator.routeToTabs()
    }
}
