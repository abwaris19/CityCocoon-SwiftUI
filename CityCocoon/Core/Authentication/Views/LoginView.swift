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
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 24)
                    
                    SecureField("Enter Your Pass", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 24)
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
                    print("DEBUG print something")
                } label: {
                     Text("Login")
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 50)
                        .background(.pink)
                        .cornerRadius(12)
                        .padding()
                }
                .padding(.vertical)
                
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

#Preview {
    LoginView()
}
