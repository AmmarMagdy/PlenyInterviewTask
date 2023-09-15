//
//  CustomInputView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI

struct CustomInputView<Content: View>: View {
    
    var title: String
    var inputView: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(Font.sfProDisplay(.bold, size: 15))
                .foregroundColor(Color.gray())
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.borderColor(), style: StrokeStyle(lineWidth: 1))
                .overlay {
                    inputView.padding()
                }
                .font(Font.sfProDisplay(.regular, size: 17))
                .frame(height: 42)
        }.padding(.horizontal)
    }
}

