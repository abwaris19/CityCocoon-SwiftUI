//
//  UserProfileHeaderView.swift
//  CityCocoon
//
//  Created by Khan on 13.01.2024.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
            
            VStack (spacing: 12) {
                
                CircularProfileView(size: .large)
                
                VStack {
                    Text("AB Devlier")
                    Text("Guest")
                        .font(.footnote)
                }
            }
        }
      
    }
}

#Preview {
    UserProfileHeaderView()
}
