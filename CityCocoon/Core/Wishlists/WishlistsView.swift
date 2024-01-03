//
//  WishlistsView.swift
//  CityCocoon
//
//  Created by Khan on 03.01.2024.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        
        NavigationStack {
            
        VStack (alignment: .leading, spacing:32) {
            
            VStack (alignment: .leading, spacing: 4){
                Text("Log in to view your wishlists")
                    .font(.headline)
                Text("You can create, view or edit whistslist once you've logged in ")
                    .font(.footnote)
            }.padding(.horizontal)
            
            
            
            Button(action: {
                
            }, label: {
                Text("Login")
                    .padding()
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 48)
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                
                
            })
                
            }.navigationTitle("Whislists")
            
            Spacer()
            
        }
    }
}

#Preview {
    WishlistsView()
}
