//
//  ListingImageCarouselView.swift
//  CityCocoon
//
//  Created by Khan on 29.12.2023.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing: Listing

    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
