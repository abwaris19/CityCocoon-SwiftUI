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
                    SecureField("Enter Your Pass", text: $password)
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
                
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
