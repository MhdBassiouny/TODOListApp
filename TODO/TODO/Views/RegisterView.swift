//
//  Register.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start Organizing todos",
                       angle: -15,
                       backgroud: .orange)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                
                TLButton(
                    title: "Register",
                    background: .green
                ) {
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
