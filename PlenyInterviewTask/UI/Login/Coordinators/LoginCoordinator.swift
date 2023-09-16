//
//  LoginCoordinator.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

//import Foundation
//
//protocol LoginCoordinator: AnyObject {
//    func routeToTabs()
//}

import SwiftUI
import Stinsen
import Foundation

final class LoginCoordinator: NavigationCoordinatable {
   
    var stack: Stinsen.NavigationStack<LoginCoordinator> = Stinsen.NavigationStack(initial: \.start)
    
    @Root var start = makeStart
    @Root var tabs = makeTabs

    // This is used to define which protocol that should be used when storing the router. It's used together with @RouterObject in DefaultLoginViewModel. If you don't use RouterObject, or if you do not need a protocol for LoginCoordinator, this can be removed.
    
    lazy var routerStorable: LoginCoordinator = self
    
//    private let api = DefaultAPI()
    
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
