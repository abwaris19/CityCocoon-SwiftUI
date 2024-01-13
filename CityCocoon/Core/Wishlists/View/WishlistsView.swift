//
//  WishlistsView.swift
//  CityCocoon
//
//  Created by Khan on 03.01.2024.
//

import SwiftUI

struct WishlistsView: View {
    
    @State private var showLogin = false
    
    private let authManager: AuthManager
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if authManager.userSessionId == nil
                {
                 WishListLoginView(showLogin: $showLogin)
                }
                else {
                    WishlistEmptyStateView()
                }
               
                
                
            }.padding()
            .sheet(isPresented: $showLogin, content: {
                LoginView(authManager: authManager)
            })
            .navigationTitle("Whislists")
            
            Spacer()
            
        }
    }
}

#Preview {
    WishlistsView(authManager: AuthManager(service: MockAuthService()))
}
