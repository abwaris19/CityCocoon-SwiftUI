//
//  ListingItemView.swift
//  CityCocoon
//
//  Created by Khan on 28.12.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    var body: some View {
       
        VStack(spacing: 8) {
            
            // images
            
            ListingImageCarouselView(listing: listing)
         
            // listing detils
            
            HStack (alignment: .top)
            {
                // details
                
                VStack (alignment: .leading) {
                    
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    .foregroundStyle(.black)
                    
                    
                    Text("Nov 3 - 10")
                    .foregroundStyle(.black)
                       
                    
                    HStack
                    {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                    .foregroundStyle(.black)
                    
                    
                }
                
                // rating
                
                Spacer()
                
                HStack (spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.92")
                }
                .foregroundStyle(.black)
                
            }
            .font(.footnote)
            
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
