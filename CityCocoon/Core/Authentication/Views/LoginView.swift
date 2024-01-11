//
//  LoginView.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel(service: MockAuthService())
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Spacer()
                Image(.airbnbAppIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your Email ", text: $email)
                        .modifier(PrimaryTextModifiers())
                    
                    SecureField("Enter Your Pass", text: $password)
                        .modifier(PrimaryTextModifiers())
                }
                
                NavigationLink {
                    
                } label: {
                     Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 30)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                
                Button  {
                    Task {
                        await viewModel.login(withEmail: email, password: password)
                    }
                } label: {
                     Text("Login")
                        .modifier(PrimaryButtonModifiers())
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                
                Spacer()
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }.font(.footnote)
                    
                }.padding(.vertical)
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty
        
    }
}
#Preview {
    LoginView()
}
