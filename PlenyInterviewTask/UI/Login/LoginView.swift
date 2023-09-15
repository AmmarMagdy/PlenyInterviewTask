//
//  LoginView.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 32) {
                    Image("header")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .top)
                    Text("Welcome")
                        .font(.sfProDisplay(.bold, size: 20))
                        .foregroundColor(.primaryColor())
                    VStack(spacing: 24) {
                        CustomInputView(title: "User Name", inputView: TextField("Enter user name", text: $viewModel.userName))
                        CustomInputView(title: "Password", inputView: SecureInputView("Enter your password", text: $viewModel.password))
                    }
                    Button(action: {
                        if viewModel.validateForm() {
                            viewModel.login()
                        }
                    }, label: {
                        Text("Sign in")
                            .font(Font.sfProDisplay(.medium, size: 17))
                            .frame(width: geometry.size.width - 32, height: 46)
                            .background(Color.primaryColor())
                            .foregroundColor(Color.white)
                            .cornerRadius(32)
                    }).padding()
                }.alert(viewModel.errorMessage ?? "", isPresented: $viewModel.showAlert) {}
                    .edgesIgnoringSafeArea(.top)
                    .frame(maxHeight: .infinity, alignment: .top)
                if viewModel.showProgressView {
                    ProgressView()
                        .tint(Color.white)
                        .scaleEffect(1.8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.3))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let environment = AppEnvironment.bootstrap()
        LoginView(viewModel: environment.container.viewModels.loginViewModel)
    }
}
