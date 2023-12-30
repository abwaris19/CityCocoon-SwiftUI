//
//  DestinationSearch.swift
//  CityCocoon
//
//  Created by Khan on 30.12.2023.
//

import SwiftUI

struct DestinationSearch: View {
    @Binding  var isShow: Bool
    @State var destination: String = ""
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
                            .foregroundStyle(.gray)
                            
                    }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    DestinationSearch(isShow: .constant(false))
}
