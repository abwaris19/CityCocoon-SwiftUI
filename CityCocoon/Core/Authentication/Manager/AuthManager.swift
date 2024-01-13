//
//  AuthManager.swift
//  CityCocoon
//
//  Created by Khan on 13.01.2024.
//

import Foundation
class AuthManager: ObservableObject {
    @Published var userSessionId: String?
    
    private let service: MockAuthService
        init(service: MockAuthService) {
            self.service = service
        }
    
    @MainActor
    func login (withEmail email: String, password: String) async throws {
        self.userSessionId = try await service.login(withEmail: email, password: password)
    } 
    
    @MainActor
    func createUser (withEmail email: String, password: String, fullname: String) async throws {
        self.userSessionId = service.createUser(withEmail: email, password: password, fullname: fullname)
    }
    
    @MainActor
    func signout() {
        service.singout()
        self.userSessionId = nil
    }
}
