//
//  RegisterViewModel.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    private let service: MockAuthService
    init(service: MockAuthService) {
        self.service = service
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async {
        do {
            try await service.createUser(withEmail: email, password: password, fullname: fullname) 
        }
        catch {
            print("Failed \(error.localizedDescription)")
        }
    }
}
