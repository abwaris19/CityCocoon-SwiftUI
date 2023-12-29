//
//  ExploreView.swift
//  CityCocoon
//
//  Created by Khan on 28.12.2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
       
        NavigationView {
            
            ScrollView
            {
                SearchAndFilterBar()
                LazyVStack (spacing: 32) {
                    
                    ForEach(0...10, id: \.self) { listing in
                      
                        NavigationLink(destination: Text("Hello \(listing)")) {
                            
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                
                }.padding()
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing detial view....")
            }
          
        }
        
    }
}

#Preview {
    ExploreView()
}
