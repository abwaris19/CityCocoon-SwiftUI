//
//  MockAuthService.swift
//  CityCocoon
//
//  Created by Khan on 11.01.2024.
//

import Foundation

struct MockAuthService {
    
    func login(withEmail email: String, password: String ) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) -> String? {
        return NSUUID().uuidString
    }
    
    func singout(){}
}
