//
//  AuthServiceProtocol.swift
//  CityCocoon
//
//  Created by Khan on 13.01.2024.
//

import Foundation

protocol AuthServiceProtocol {
    
    func login(withEmail email: String, password: String ) async throws -> String? 
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String?
    func singout()
}
