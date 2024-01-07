//
//  ListingMapView.swift
//  CityCocoon
//
//  Created by Khan on 07.01.2024.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    
    private let listings: [Listing]
    @State private var cameraPosition: MapCameraPosition
    @State private var selectedListing: Listing?
    
    init(listings: [Listing], center: CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        let coordinateRegion = MKCoordinateRegion(center: center, latitudinalMeters: 50000, longitudinalMeters: 50000)
        self._cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    var body: some View {
      
        ZStack {
            Map(position: $cameraPosition, selection: $selectedListing) {
            
                ForEach(listings) { listing in
                    
                    Marker("", coordinate: listing.coordinate)
                        .tag(listing.id)
                }
            }
        }
        
        
    }
}

#Preview {
    ListingMapView(listings: DeveloperPreview.shared.listings)
}
