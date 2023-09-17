//
//  FullScreenImage.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 17/09/2023.
//

import SwiftUI

struct FullScreenImage: View {
    
    @State private var showingSheet = false
    @State private var scale: CGFloat = 1
    
    var image: Image
    
    var body: some View {
        image.resizable().onTapGesture {
            showingSheet.toggle()
        }.sheet(isPresented: $showingSheet) {
            VStack {
                image.scaleEffect(scale)
                    .padding()
                    .contentShape(Rectangle())
                    .gesture(MagnificationGesture()
                        .onChanged() { value in
                            scale = value
                        })
            }
        }
    }
    
    init(_ image: Image) {
        self.image = image
    }
}
