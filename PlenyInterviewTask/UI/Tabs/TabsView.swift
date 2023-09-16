//
//  TabsView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

enum Tab {
    case main
    case stors
    case offers
    case gallery
    case profile
}

struct TabsView: View {
    
    // MARK: Stored Properties
    var environment = AppEnvironment.bootstrap()
    
    // MARK: Views
    var body: some View {
        TabView {
            NavigationView {
                PostView(viewModel: environment.container.viewModels.postsViewModel)
            }
            .tabItem { Image("home") }
            .tag(Tab.main)
            .navigationViewStyle(StackNavigationViewStyle())
            
            LoginView(viewModel: environment.container.viewModels.loginViewModel)
                .tabItem { Image("shop") }
                .tag(Tab.stors)
            
            LoginView(viewModel: environment.container.viewModels.loginViewModel)
                .tabItem { Image("discount") }
                .tag(Tab.offers)
            
            LoginView(viewModel: environment.container.viewModels.loginViewModel)
                .tabItem { Image("gallery") }
                .tag(Tab.gallery)
            
            LoginView(viewModel: environment.container.viewModels.loginViewModel)
                .tabItem { Image("profile") }
                .tag(Tab.profile)
        }
        .shadow(color: Color.borderColor(), radius: 25, x: 20, y: 15)
        .accentColor(Color.primaryColor())
    }
       
    
}
