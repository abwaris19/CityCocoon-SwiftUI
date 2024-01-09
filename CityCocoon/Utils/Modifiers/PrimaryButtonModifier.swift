//
//  PrimaryButtonModifier.swift
//  CityCocoon
//
//  Created by Khan on 09.01.2024.
//

import SwiftUI

struct PrimaryButtonModifiers: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(width: 350, height: 50)
            .background(.pink)
            .cornerRadius(12)
            .padding()
    }
    
}
