//
//  ErrorView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI

struct ErrorView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                VStack {
                    Button("Ok") {}
                        .buttonStyle(.borderedProminent)
                }
            }
    }
}
