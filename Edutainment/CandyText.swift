//
//  CandyText.swift
//  Edutainment
//
//  Created by Oguzhan Ozturk on 8.06.2023.
//

import Foundation
import SwiftUI

struct CandyText: View {
    
    var body: some View {
        Text(text)
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
            .background(color.opacity(0.1))
            .foregroundColor(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(color))
    }
    
    let text: String
    let color: Color
    
    init(text: String,color: Color) {
        self.color = color
        self.text = text
    }
    
}
