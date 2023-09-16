//
//  PostCell.swift
//  Helper
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack {
                    Text("Neama Ahmed")
                    //.font(.sfProDisplay(.regular, size: 17))
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("2 days ago")
                    //.font(.sfProDisplay(.regular, size: 17))
                        .foregroundColor(Color.gray)
                        .fontWeight(.regular)
                    //.font(.sfProDisplay(.regular, size: 13))
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            Text("2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago2 days ago")
            //.font(.sfProDisplay(.regular, size: 17))
                .foregroundColor(Color.gray)
                .fontWeight(.regular)
            
            HStack(spacing: 5) {
                Image("item3")
                    .resizable()
                    .frame(width: 185, height: 345)
                VStack(spacing: 5) {
                    Image("item1")
                        .resizable()
                        .frame(width: 185, height: 170)
                        .scaledToFill()
                        .background(.gray)
                    Image("item2")
                        .resizable()
                        .frame(width: 185, height: 170)
                }
            }
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.top)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
