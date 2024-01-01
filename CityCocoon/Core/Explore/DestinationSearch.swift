//
//  DestinationSearch.swift
//  CityCocoon
//
//  Created by Khan on 30.12.2023.
//

import SwiftUI

enum DestinationSearchOption{
    
    case location
    case dates
    case guests
}
struct DestinationSearch: View {
    @Binding  var isShow: Bool
    @State var destination: String = ""
    
    @State private var selectedOption: DestinationSearchOption  = .location
    @State private var datesOption: DestinationSearchOption  = .dates
    @State private var guestsOption: DestinationSearchOption  = .guests
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 0
   
   
    var body: some View {
       
        VStack {
            
            Button(action: {
           
                withAnimation(.snappy) {
                    isShow.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.black)
            })
         
            VStack (alignment: .leading) {
                if selectedOption == .location  {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search Destination", text: $destination)
                            .font(.subheadline)
                            
                    }.frame( height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                                
                        }
                  
                } else
                {
                        CollapesPickerView(title: "Where", description: "Add Destination")
                    }
           
            }.padding()
                .frame(height: selectedOption == .location ? 120: 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    
                    withAnimation(.snappy) { selectedOption = .location}
                }
            
            VStack (alignment: .leading) {
                if selectedOption == .dates {
                    
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else {
                    CollapesPickerView(title: "when", description: "Add Dates")
                    }
                } .padding()
                .frame(height: selectedOption == .dates ? 180: 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    
                    withAnimation(.snappy) { selectedOption = .dates}
                }
        }
            VStack {
                if selectedOption == .guests {
                    
                   Text("Who's coming ?")
                        .font(.title)
                        .fontWeight(.semibold)
                    Stepper {
                        
                        Text("\(numGuest) Adult")
                    } onIncrement: {
                        
                        numGuest += 1
                    } onDecrement: {
                        
                        numGuest -= 1
                    }

                    
                }
                else {
                    CollapesPickerView(title: "Who", description: "Add Guest") .onTapGesture {
                        
                        withAnimation(.snappy) { selectedOption = .guests}
                    }
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120: 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                
                withAnimation(.snappy) { selectedOption = .guests}
            }
            
          
            
        
        
    }
}

#Preview {
    DestinationSearch(isShow: .constant(false))
}

struct CollapesPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                
                Text(description)
            }.fontWeight(.semibold)
                .font(.subheadline)
        }
    }
}
