//
//  ExploreService.swift
//  CityCocoon
//
//  Created by Khan on 05.01.2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        
        return DeveloperPreview.shared.listings
    }
}
