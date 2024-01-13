//
//  LoginViewModel.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authManager: AuthManager
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        }
        catch {
            print("Failed \(error.localizedDescription)")
        }
    }
}
