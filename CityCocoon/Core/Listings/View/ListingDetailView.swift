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
    var body: some View {
       
        ScrollView {
            ZStack (alignment: .topLeading) {
                ListingImageCarouselView()
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
                })
            }
            
            
            VStack (alignment:.leading, spacing: 8) {
                
                Text("Switzerland")
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
                    
                    Text("Winterthur, Zurich")
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
                        Text("4 guests")
                        Text("4 bads")
                        Text("4 bedroom")
                        Text("4 bath")
                    }
                    .font(.caption)
                } .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("profile1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
            }.padding()
            
            Divider()
            
            // list features
            
            VStack (alignment: .leading, spacing: 16) {
                ForEach(0..<2) { features in
                    
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack (alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Superhost are experience, highly rated hosts whoa re commited to providing star for guest")
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
                            
                            ForEach(1...4, id:\.self) { bedroom in
                         
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
                
                ForEach(1...5, id: \.self){ offers in
                    
                    HStack {
                        
                        Image(systemName: "wifi")
                        Text("Wifi")
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
               Map()
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
                        
                        Text("$500")
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
    ListingDetailView()
}
