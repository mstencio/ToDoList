//
//  RegisterView.swift
//  toDoList
//
//  Created by Mau on 26/2/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Start organizing things", angle: -15, background: .yellow)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                
                TLButton(title: "Create Account", background: .green) {
                    // Attempt to registration 
                    viewModel.register()
                }
                
            }
            .offset()
        }
    }
}

#Preview {
    RegisterView()
}
