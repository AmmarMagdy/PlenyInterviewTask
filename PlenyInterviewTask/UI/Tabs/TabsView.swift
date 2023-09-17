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
    
    var environment = AppEnvironment.bootstrap()
    
    var body: some View {
        TabView {
            createTabItem(view: PostView(viewModel: environment.container.viewModels.postsViewModel),
                          image: Image("home"),
                          tag: Tab.main)
            
            createTabItem(view: ContentView(title: "Shop"),
                          image: Image("shop"),
                          tag: Tab.stors)
            
            createTabItem(view: ContentView(title: "Discount"),
                          image: Image("discount"),
                          tag: Tab.offers)
            
            createTabItem(view: ContentView(title: "Gallery"),
                          image: Image("gallery"),
                          tag: Tab.gallery)
            
            createTabItem(view: ContentView(title: "Profile"),
                          image: Image("profile"),
                          tag: Tab.profile)
        }
        .accentColor(Color.primaryColor())
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().isTranslucent = false
        }
    }
    
    func createTabItem<T: Hashable>(view: some View, image: Image ,tag: T) -> some View {
        view.tabItem() {
            image
        }.tag(tag)
    }
}
