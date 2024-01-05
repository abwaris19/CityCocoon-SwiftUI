//
//  ExploreViewModel.swift
//  CityCocoon
//
//  Created by Khan on 05.01.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService
    init(service: ExploreService) {
        self.service = service
        
        Task {
            await fetchListings()
        }
    }
      
    
    func fetchListings() async {
        
        do {
            self.listings = try await service.fetchListings()
        }
        catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
