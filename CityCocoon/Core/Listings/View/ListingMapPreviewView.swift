//
//  ListingMapPreviewView.swift
//  CityCocoon
//
//  Created by Khan on 08.01.2024.
//

import SwiftUI

struct ListingMapPreviewView: View {
    let listing: Listing
    var body: some View {
       
        VStack {
            TabView {
                ForEach(listing.imageURLs, id: \.self) { imageUrl in
                    
                    Image(imageUrl)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                }
            }
            .frame(height: 270)
            .tabViewStyle(.page)
            
            HStack (alignment: .top) {
                
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("8 nights: Nov 12 -22")
                    
                    HStack {
                        
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("Night")
                    }
                }
                
                Spacer()
                
                Text("4.899")
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ListingMapPreviewView(listing: DeveloperPreview.shared.listings[0])
}
