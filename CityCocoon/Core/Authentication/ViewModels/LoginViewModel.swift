//
//  LoginViewModel.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let service: MockAuthService
    init(service: MockAuthService) {
        self.service = service
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await service.login(withEmail: email, password: password)
        }
        catch {
            print("Failed \(error.localizedDescription)")
        }
    }
}
