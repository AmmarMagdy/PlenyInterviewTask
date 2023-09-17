//
//  PostCoordinator.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI
import Stinsen
import Foundation

final class PostCoordinator: NavigationCoordinatable {
   
    var stack: Stinsen.NavigationStack<PostCoordinator> = Stinsen.NavigationStack(initial: \.start)
    
    @Root var start = makeStart

    lazy var routerStorable: PostCoordinator = self
        
    func makeStart() -> some View {
        let environment = AppEnvironment.bootstrap()
        return PostView(viewModel: environment.container.viewModels.postsViewModel)
    }
}
