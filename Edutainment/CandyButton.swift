//
//  CandyButton.swift
//  Edutainment
//
//  Created by Oguzhan Ozturk on 25.04.2023.
//

import SwiftUI

struct CandyButton: ButtonStyle {
    
    let color: Color
    @State var isAnimated = false
    @State var animAmount = 1.0
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { val in
            configuration
                .label
                .frame(width: val.size.width, height: val.size.height, alignment: .center)
                .font(.title)
                //.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                //.frame(width: 90, height: 90, alignment: .center)
                .background(color.opacity(0.3))
                .foregroundColor(color)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4).foregroundColor(color))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(configuration.isPressed ? 1.05 : 1)
                .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        }
    }
    
}

struct CandyButtonNonAnim: ButtonStyle {
    
    let color: Color
    @State var isAnimated = false
    @State var animAmount = 1.0
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { val in
            configuration
                .label
                .frame(width: val.size.width, height: val.size.height, alignment: .center)
                .background(color.opacity(0.3))
                .foregroundColor(color)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4).foregroundColor(color))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct buttonPreview: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
