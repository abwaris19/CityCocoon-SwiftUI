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
    @State private var showMapView = false
  
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
                .overlay(alignment:.bottom)
                {
                    
                    Button(action: {
                       
                        showMapView.toggle()
                    }, label: {
                        HStack  {
                            
                            Text("Map")
                            Image(systemName: "paperplane")
                            
                            
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(Color.black)
                        .clipShape(Capsule())
                        .padding()
                    })
                           } .sheet(isPresented: $showMapView, content: {
                               ListingMapView(listings: viewModel.listings)
                           })
            }
               

          
          
        }
        
    }
}

#Preview {
    ExploreView()
}
