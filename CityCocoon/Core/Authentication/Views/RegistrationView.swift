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
    var body: some View {
     
        VStack {
      
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
            
        }
    }
}

#Preview {
    RegistrationView()
}
