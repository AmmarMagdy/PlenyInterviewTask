//
//  LoginView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 32) {
                Image("header")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .top)
                Text("Welcome")
                    .font(.sfProDisplay(.bold, size: 20))
                    .foregroundColor(.primaryColor())
                VStack(spacing: 24) {
                    CustomInputView(title: "User Name", inputView: TextField("Enter user name", text: $userName))
                    CustomInputView(title: "Password", inputView: SecureInputView("Enter your password", text: $password))
                }
                Button(action: {
                    // Your action code here
                }, label: {
                    Text("Sign in")
                        .font(Font.sfProDisplay(.medium, size: 17))
                        .frame(width: geometry.size.width - 32, height: 46)
                        .background(Color.primaryColor())
                        .foregroundColor(Color.white)
                        .cornerRadius(32)
                    
                }).padding()
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
