//
//  ProfileView.swift
//  CityCocoon
//
//  Created by Khan on 02.01.2024.
//

import SwiftUI

struct ProfileView: View {
    
    private let authManager: AuthManager
    @State private var showLogin = false
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        
        // Profile Login View
   
        if authManager.userSessionId == nil {
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
                    LoginView(authManager: authManager)
                })
                
                HStack {
                    Text("Don't Have an Account ")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                    
                }.font(.caption)
            }
        }else
        {
            Text("show profile stuff here..")
        }
        
        VStack (spacing: 2) {
            ProfileOptionView(imageName: "gear", title: "Settings")
            ProfileOptionView(imageName: "gear", title: "Accessibility")
            ProfileOptionView(imageName: "questionmark.circle", title: "Visit the Help Center")
        }
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}
