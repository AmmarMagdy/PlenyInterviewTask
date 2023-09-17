//
//  PostCell.swift
//  Helper
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostCell: View {
    
    @ObservedObject var viewModel: PostViewModel
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            userView
            Text(viewModel.post?.body ?? "")
                .font(.sfProDisplay(.regular, size: 17))
                .foregroundColor(Color.gray())
            imagesList
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var userView: some View {
        HStack {
            FullScreenImage(Image("postProfile"))
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Neama Ahmed")
                    .font(.sfProDisplay(.regular, size: 17))
                    .foregroundColor(Color.gray())
                
                Text("2 days ago")
                    .frame(alignment: .leading)
                    .foregroundColor(Color.gray())
                    .font(.sfProDisplay(.regular, size: 13))
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var imagesList: some View {
        HStack(spacing: 5) {
            FullScreenImage(Image("item3"))
                .frame(width: 185, height: 345)
            
            VStack(spacing: 5) {
                FullScreenImage(Image("item1"))
                    .frame(width: 185, height: 170)
                    .scaledToFill()
                
                FullScreenImage(Image("item2"))
                    .frame(width: 185, height: 170)
            }
        }
    }
    
    init(post: Post?) {
        self.viewModel = PostViewModel(post: post)
    }
}
