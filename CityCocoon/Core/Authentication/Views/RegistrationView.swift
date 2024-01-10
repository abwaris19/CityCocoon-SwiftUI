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
                
                TextField("Enter your FullName ", text: $email)
                    .modifier(PrimaryTextModifiers())
                
              
            }
            Button  {
                print("DEBUG print something")
            } label: {
                 Text("Create Account")
                    .modifier(PrimaryButtonModifiers())
            }
            .padding(.vertical)
            
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

#Preview {
    RegistrationView()
}
