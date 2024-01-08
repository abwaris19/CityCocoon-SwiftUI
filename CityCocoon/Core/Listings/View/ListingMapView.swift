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
    @Environment(\.dismiss) var dismiss
    @State private var showDetial = false
    
    init(listings: [Listing], center: CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        let coordinateRegion = MKCoordinateRegion(center: center, latitudinalMeters: 50000, longitudinalMeters: 50000)
        self._cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    var body: some View {
      
        ZStack {
            ZStack (alignment:.bottom) {
                Map(position: $cameraPosition, selection: $selectedListing) {
                    
                    ForEach(listings, id: \.self) { listing in
                        
                        Marker("", coordinate: listing.coordinate)
                            .tag(listing.id)
                    }
                }
                
                
                if let selectedListing {
                    withAnimation(.spring) {
                        ListingMapPreviewView(listing: selectedListing)
                            .onTapGesture {
                                showDetial.toggle()
                            }
                    }
                }
            }
        }.overlay(alignment: .topLeading) {
            
            Button {
                dismiss()
            } label: {
               
                Image(systemName: "chevron.left")
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                            .shadow(radius: 4)
                    )
                    
            }.padding()
        }
      
        .fullScreenCover(isPresented: $showDetial, content: {
            
            if let selectedListing {
                ListingDetailView(listing: selectedListing)
            }
        })
        
        
    }
}

#Preview {
    ListingMapView(listings: DeveloperPreview.shared.listings)
}
