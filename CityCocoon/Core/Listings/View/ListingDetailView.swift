//
//  ListingDetailView.swift
//  CityCocoon
//
//  Created by Khan on 29.12.2023.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment (\.presentationMode) var dismiss
    var listing: Listing
    @State private var cameraPosition : MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion( center: listing.city == "Los Angeles" ? .losAngeles : .miami , span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
       
        ScrollView {
            ZStack (alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                
                Button(action: {
                        
                    dismiss.wrappedValue.dismiss()
                    print("Close")
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }).padding(.vertical)
            }
            
            
            VStack (alignment:.leading, spacing: 8) {
                
                Text(listing.title)
                    .font(.title2)
                    .fontWeight(.semibold)
               
                VStack (alignment:.leading) {
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text("4.99")
                        
                        Text("28 Review")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text(" \(listing.city), \(listing.state) ")
                }.font(.caption)
                
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            
            // host information view
            
            HStack {
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack (spacing: 2) {
                        Text("\(listing.numberOfGuests) guests")
                        Text("\(listing.numberOfBeds) bads")
                        Text("\(listing.numberOfBedrooms) bedroom")
                        Text("\(listing.numberOfBathrooms) bath")
                    }
                    .font(.caption)
                } .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
            }.padding()
            
            Divider()
            
            // list features
            
            VStack (alignment: .leading, spacing: 16) {
                ForEach(listing.features) { features in
                    
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack (alignment: .leading) {
                            Text(features.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(features.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            Divider()
            
            // bedroom view
            VStack (alignment: .leading, spacing: 16) {
                
                Text("Where you will be sleep")
                    .font(.headline)
                
                ScrollView (.horizontal, showsIndicators: false)
                {
                    HStack
                    {
                        HStack {
                            
                            ForEach(1...listing.numberOfBedrooms, id:\.self) { bedroom in
                         
                                VStack {
                                    Image(systemName: "bed.double")
                                    Text(" bedroom \(bedroom)")
                                }
                                .frame(width: 132, height: 100)
                                
                                .overlay {
                                
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.black.opacity(0.4))
                                
                                }.padding(.horizontal, 2)
                                
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }.padding()
            
            Divider()
            
            // offers
            VStack(alignment: .leading, spacing: 16)  {
                
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities, id: \.self){ amenity in
                    
                    HStack {
                        
                        Image(systemName: "wifi")
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }.padding()
            
            // map
            
            Divider()
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you will be")
                    .font(.headline)
                Map(position: $cameraPosition)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }.padding()
            
        }.ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay (alignment: .bottom) {
            
            VStack {
              
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Dec-29-2023")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Reserve").foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }.padding(.horizontal, 32)
            }
            .background(.white)
          
            
        }
       
        
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[3])
}
