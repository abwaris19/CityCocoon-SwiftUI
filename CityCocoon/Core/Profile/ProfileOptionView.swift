//
//  ProfileOptionView.swift
//  CityCocoon
//
//  Created by Khan on 02.01.2024.
//

import SwiftUI

struct ProfileOptionView: View {
    
    let imageName: String
    let title: String
    var body: some View {
       
        HStack {
            Image(systemName: imageName)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }.padding()
        
        Divider()
    }
}

#Preview {
    ProfileOptionView(imageName: "gear", title: "Settings")
}
