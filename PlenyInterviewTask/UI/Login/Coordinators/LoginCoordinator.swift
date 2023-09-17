//
//  LoginCoordinator.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI
import Stinsen
import Foundation

final class LoginCoordinator: NavigationCoordinatable {
   
    var stack: Stinsen.NavigationStack<LoginCoordinator> = Stinsen.NavigationStack(initial: \.start)
    
    @Root var start = makeStart
    @Root var tabs = makeTabs

    lazy var routerStorable: LoginCoordinator = self
        
    func makeStart() -> some View {
        let environment = AppEnvironment.bootstrap()
        return LoginView(viewModel: environment.container.viewModels.loginViewModel)
    }
   
    func makeTabs() -> TabsCoordinator {
        return TabsCoordinator()
    }
    
    func routeToTabs() {
        self.root(\.tabs)
    }
}
