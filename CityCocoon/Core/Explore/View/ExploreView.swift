//
//  ExploreView.swift
//  CityCocoon
//
//  Created by Khan on 28.12.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
  
    var body: some View {
       
        NavigationStack {
            
            if showDestinationSearchView {
                withAnimation(.snappy) {
                    DestinationSearch(isShow: $showDestinationSearchView, viewModel: viewModel)
                        
                }
            }
            else
            {
                ScrollView
                {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 32) {
                        
                        ForEach(viewModel.listings) { listing in
                          
                            NavigationLink(destination: ListingDetailView(listing: listing).navigationBarBackButtonHidden()) {
                                
                                ListingItemView(listing: listing)
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
