//
//  PostView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel: PostsViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<viewModel.items.count, id: \.self) { index in
                    PostCell(post: viewModel.post(at: index))
                        .onAppear() {
                            viewModel.loadMoreContent(post: viewModel.post(at: index))
                        }
                    Divider()
                }
              
            }
            if viewModel.showProgressView {
                ProgressView()
            }
        }
        .onAppear() {
            viewModel.getPosts()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let environment = AppEnvironment.bootstrap()
        PostView(viewModel: environment.container.viewModels.postsViewModel).onAppear()
    }
}
