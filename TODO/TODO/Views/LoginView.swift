//
//  Login.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            HeaderView(title: "TODO List", 
                       subtitle: "Get things done",
                       angle: 15,
                       backgroud: .pink)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("EmailAddress", text: $viewModel.email)
                    .textInputAutocapitalization(.none)

                SecureField("EmailAddress", text: $viewModel.password)

                TLButton(
                    title: "Log in",
                    background: .blue
                ) {
                    viewModel.login()
                }
            }
            .offset(y: -50)
            
            VStack {
                Text("New to TODO?")
                NavigationLink("Create an Accounnt", destination: RegisterView())
            }
            .padding(.bottom, 20)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
