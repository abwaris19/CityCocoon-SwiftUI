//
//  CityCocoonApp.swift
//  CityCocoon
//
//  Created by Khan on 27.12.2023.
//

import SwiftUI

@main
struct CityCocoonApp: App {
    let authManager = AuthManager(service: MockAuthService())
    var body: some Scene {
        WindowGroup {
            ContentView(authManager: authManager)
        }
    }
}
