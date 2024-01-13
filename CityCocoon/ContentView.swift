//
//  ContentView.swift
//  CityCocoon
//
//  Created by Khan on 27.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    private let authManager: AuthManager
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    var body: some View {
       
            MainTabView(authManager: authManager)
    }
}

#Preview {
    ContentView(authManager: AuthManager(service: MockAuthService()))
}
