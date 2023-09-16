//
//  PostCell.swift
//  Helper
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostCell: View {
    
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        VStack {
            userView
            
            Text(viewModel.post?.body ?? "")
                .font(.sfProDisplay(.regular, size: 17))
                .foregroundColor(Color.gray())
            
            imagesList
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.top)
    }
    
    var userView: some View {
        HStack {
            Image("postProfile")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack {
                Text("Neama Ahmed")
                    .font(.sfProDisplay(.regular, size: 17))
                    .foregroundColor(Color.gray())
                
                Text("2 days ago")
                    .foregroundColor(Color.gray())
                    .font(.sfProDisplay(.regular, size: 13))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 10)
    }
    
    var imagesList: some View {
        HStack(spacing: 5) {
            Image("item3")
                .resizable()
                .frame(width: 185, height: 345)
            VStack(spacing: 5) {
                Image("item1")
                    .resizable()
                    .frame(width: 185, height: 170)
                    .scaledToFill()
                Image("item2")
                    .resizable()
                    .frame(width: 185, height: 170)
            }
        }
    }
    
    init(post: Post?) {
        self.viewModel = PostViewModel(post: post)
    }
}
