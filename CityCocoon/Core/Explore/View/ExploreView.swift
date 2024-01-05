//
//  ExploreView.swift
//  CityCocoon
//
//  Created by Khan on 28.12.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
  
    var body: some View {
       
        NavigationStack {
            
            if showDestinationSearchView {
                withAnimation(.snappy) {
                    DestinationSearch(isShow: $showDestinationSearchView)
                }
            }
            else
            {
                ScrollView
                {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 32) {
                        
                        ForEach(0...10, id: \.self) { listing in
                          
                            NavigationLink(destination: ListingDetailView().navigationBarBackButtonHidden()) {
                                
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    
                    }.padding(.horizontal, 10)
                }
                .navigationDestination(for: Int.self) { listing in
                    Text("Listing detial view....")
                }
            }
          
          
        }
        
    }
}

#Preview {
    ExploreView()
}
