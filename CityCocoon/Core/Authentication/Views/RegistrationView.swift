//
//  RegistrationView.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var registerViewModel = RegisterViewModel(service: MockAuthService())
    var body: some View {
     
        VStack {
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
                
                TextField("Enter your FullName ", text: $fullName)
                    .modifier(PrimaryTextModifiers())
                
              
            }
            Button  {
              
                Task {
                    await registerViewModel.createUser(withEmail:  email, password: password, fullname: fullName)
                }
            } label: {
                 Text("Create Account")
                    .modifier(PrimaryButtonModifiers())
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.7)
            
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account")
                    Text("Sign In").fontWeight(.semibold)
                }
                .font(.footnote)
            }.padding(.vertical)

            
           
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        !fullName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
