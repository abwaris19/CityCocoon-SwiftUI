//
//  ProfileLoginView.swift
//  CityCocoon
//
//  Created by Khan on 13.01.2024.
//

import SwiftUI

struct ProfileLoginView: View {
    
    @Binding var showLogin: Bool
    var body: some View {
      
        
            VStack (alignment: .leading, spacing: 32){
                
                VStack {
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Login to start your plan next trip")
                    }
                }
                
                Button(action: {
                    showLogin.toggle()
                }, label: {
                    Text("Login")
                        .padding()
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .foregroundStyle(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    
                    
                }).sheet(isPresented: $showLogin, content: {
                    //LoginView(authManager: authManager)
                })
                
                HStack {
                    Text("Don't Have an Account ")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                    
                }.font(.caption)
            }
        
        
    }
}

#Preview {
    ProfileLoginView(showLogin: .constant(false))
}
