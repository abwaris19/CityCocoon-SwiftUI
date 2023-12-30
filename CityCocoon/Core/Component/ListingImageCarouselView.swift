//
//  ListingImageCarouselView.swift
//  CityCocoon
//
//  Created by Khan on 29.12.2023.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var imageList: [String] = [
        "home1", "home2", "home3"
    ]
    var body: some View {
        TabView {
            ForEach(imageList, id: \.self) { image in
                
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
    ListingImageCarouselView()
}
