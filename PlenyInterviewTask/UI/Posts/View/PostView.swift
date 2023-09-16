//
//  PostView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel: PostsViewModel
    
    @State var text: String = ""
    @State var showTextField: Bool = false
    
    var body: some View {
        VStack {
            headerView
            Divider().padding(.bottom, 8)
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
        }.onAppear() {
            viewModel.getPosts()
        }
    }
    
    var headerView: some View {
        ZStack {
            if showTextField {
                HStack {
                    Image("search")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding([.leading, .vertical])
                    TextField("ammar", text: $text)
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showTextField.toggle()
                        }
                    } label: {
                        Image("close")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(8)
                    }
                }.frame(height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.borderColor(), lineWidth: 1)
                ).frame(height: 40).padding(.horizontal)
            } else {
                HStack {
                    Image("logo")
                    Spacer()
                    Button {
                        withAnimation(.easeOut(duration: 0)) {
                            showTextField.toggle()
                        }
                    } label: {
                        Image("search")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(8)
                    }
                }.padding(.horizontal)
                .frame(height: 40)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let environment = AppEnvironment.bootstrap()
        PostView(viewModel: environment.container.viewModels.postsViewModel).onAppear()
    }
}
