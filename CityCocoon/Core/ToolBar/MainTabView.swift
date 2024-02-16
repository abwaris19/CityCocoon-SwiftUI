//
//  MainTabView.swift
//  CityCocoon
//
//  Created by Khan on 03.01.2024.
//

import SwiftUI

struct MainTabView: View {
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    var body: some View {
        
        TabView {
            ExploreView()
                .tabItem {  Label("Explore", systemImage: "magnifyingglass") }
            
            
            WishlistsView(authManager: authManager)
                .
            tabItem {  Label("Whishlists", systemImage: "heart") }
            
//            ProfileView(authManager: authManager)
//                .
//            tabItem {  Label("Profile", systemImage: "person") }
         
        }
    }
}

#Preview {
    MainTabView(authManager: AuthManager(service: MockAuthService()))
}
