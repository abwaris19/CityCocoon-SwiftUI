//
//  ExploreViewModel.swift
//  CityCocoon
//
//  Created by Khan on 05.01.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
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
    
    func updateListingsForLocation () {
        
        let filterListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filterListings.isEmpty ? listings : filterListings
    }
    
    
}
