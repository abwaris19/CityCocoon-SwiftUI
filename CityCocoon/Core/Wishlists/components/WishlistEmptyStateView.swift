//
//  WishlistEmptyStateView.swift
//  CityCocoon
//
//  Created by Khan on 14.01.2024.
//

import SwiftUI

struct WishlistEmptyStateView: View {
    var body: some View {
        
        VStack (alignment: .leading, spacing: 12) {
            Text("Create your first wishlist")
                .font(.headline)
            
            Text("As you explore, tap the heart icon to save your favorite places to wishlist")
            
        }
        .padding()
    }
}

#Preview {
    WishlistEmptyStateView()
}
