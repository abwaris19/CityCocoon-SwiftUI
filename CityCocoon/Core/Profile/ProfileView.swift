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
            
            ProfileLoginView(showLogin: $showLogin)
            
        }else
        {
            UserProfileHeaderView()
        }
        
        VStack (spacing: 2) {
            ProfileOptionView(imageName: "gear", title: "Settings")
            ProfileOptionView(imageName: "gear", title: "Accessibility")
            ProfileOptionView(imageName: "questionmark.circle", title: "Visit the Help Center")
        }.padding(.vertical)
        
       
        if authManager.userSessionId != nil
        {
            
            
            Button(action: {
                authManager.signout()
            }, label: {
                Text("Log Out")
                    .underline()
                    .foregroundStyle(.black)
                    .font(.headline)
                    .padding(.horizontal)
            })
            .frame(maxWidth:.infinity, alignment: .leading)
        }
            
            
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}
