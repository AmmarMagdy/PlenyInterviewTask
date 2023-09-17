//
//  PostView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel: PostsViewModel
    @State private var text: String = ""
    @State private var showTextField: Bool = false
    
    var body: some View {
        VStack {
            headerView
            Divider()
            if viewModel.dataIsLoading, viewModel.items.count == 0 {
                Spacer()
                ProgressView()
                Spacer()
            } else if viewModel.items.count > 0 {
                list
            } else {
                noItems
            }
        }.onAppear() {
            viewModel.getIntialPosts()
        }
    }
    
    var headerView: some View {
        ZStack {
            if showTextField {
                searchBar
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
    
    var searchBar: some View {
        HStack {
            Image("search")
                .resizable()
                .frame(width: 16, height: 16)
                .padding([.leading, .vertical])
            TextField("Search", text: $text).onChange(of: text) { newValue in
                viewModel.searchPosts(text: newValue)
            }
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if text != "" {
                        text = ""
                        viewModel.getIntialPosts()
                    }
                    showTextField.toggle()
                }
            } label: {
                Image("close")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(8)
            }
        }.frame(height: 40).overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderColor(), lineWidth: 1))
        .frame(height: 40).padding(.horizontal)
    }
    
    var noItems: some View {
        VStack {
            Spacer()
            VStack(alignment: .center) {
                Text("No Items")
                    .font(.sfProDisplay(.bold, size: 20))
                    .foregroundColor(.gray())
            }
            Spacer()
        }
    }
    
    var list: some View {
        VStack {
            List {
                ForEach(0..<viewModel.items.count, id: \.self) { index in
                    PostCell(post: viewModel.post(at: index))
                        .onAppear() {
                            viewModel.loadMoreContent(post: viewModel.post(at: index))
                        }
                }
            }
            .listStyle(.plain)
            .refreshable {
                viewModel.getIntialPosts()
            }
            if viewModel.showProgressView {
                ProgressView()
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
