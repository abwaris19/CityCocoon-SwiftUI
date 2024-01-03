//
//  MainTabView.swift
//  CityCocoon
//
//  Created by Khan on 03.01.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            ExploreView()
                .tabItem {  Label("Explore", systemImage: "magnifyingglass") }
            WishlistsView()
                .
            tabItem {  Label("Explore", systemImage: "heart") }
            ProfileView()
                .
            tabItem {  Label("Explore", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
