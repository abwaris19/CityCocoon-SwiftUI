//
//  ListingItemView.swift
//  CityCocoon
//
//  Created by Khan on 28.12.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    
    var body: some View {
       
        VStack(spacing: 8) {
            
            // images
            
            ListingImageCarouselView()
         
            // listing detils
            
            HStack (alignment: .top)
            {
                // details
                
                VStack (alignment: .leading) {
                    
                    Text("Winterthur, Zurich")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("Zurich HB, Zurich")
                        .foregroundStyle(.gray)
                    
                    .foregroundStyle(.black)
                    Text("Zurich Stadt, 8001")
                    
                    .foregroundStyle(.black)
                       
                    
                    HStack
                    {
                        Text("2700 CHF")
                            .fontWeight(.semibold)
                        
                        Text("Monthly")
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
    ListingItemView()
}
