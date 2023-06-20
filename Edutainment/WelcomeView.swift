//
//  WelcomeView.swift
//  Edutainment
//
//  Created by Oguzhan Ozturk on 25.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    var buttonFrame: (width: CGFloat,height: CGFloat) {
        let buttonWH = (UIScreen.screenWidth - 20) / 4
        return (buttonWH,buttonWH)
    }
    
    var buttonFrameLast: (width: CGFloat,height: CGFloat) {
        let buttonW = (UIScreen.screenWidth - 20) / 3
        let buttonH = (UIScreen.screenWidth - 20) / 4
        return (buttonW,buttonH)
    }
    
    let containerSpacing: CGFloat = 4
    
    @State var pressedNumberIndex: Int = 0
    @State var pressedIndexQuestion: Int = 0
    
    @State var pressetStart: Bool = false
    
    let tableStrings = ["2x","3x","4x","5x","6x","7x","8x","9x","10x","11x","12x"]
    let questionCounts = ["5","10","20"]
    
    var body: some View {
        
        if pressetStart {
            ExamScreen(examVM: ExamScreenViewModel(questionCount: questionCounts[pressedIndexQuestion], multiplyChar: tableStrings[pressedNumberIndex]))
        } else {
            VStack(alignment: .center) {
                CandyText(text: "Select the multiplication table", color: .pink)
                VStack {
                    HStack(spacing: containerSpacing) {
                        ForEach(0..<4) { index in
                            Button(tableStrings[index]) {  withAnimation {
                                pressedNumberIndex = index
                            } }
                                .buttonStyle(CandyButtonNonAnim(color: pressedNumberIndex == index ? .green : .red))
                                .frame(width: buttonFrame.width, height: buttonFrame.height, alignment: .center)
                                .font(.system(size: 22))
                        }
                    }
                    HStack(spacing: containerSpacing)  {
                        ForEach(4..<8) { index in
                            Button(tableStrings[index]) { withAnimation {
                                pressedNumberIndex = index
                            } }
                                .buttonStyle(CandyButtonNonAnim(color: pressedNumberIndex == index ? .green : .red))
                                .frame(width: buttonFrame.width, height: buttonFrame.height, alignment: .center)
                                .font(.system(size: 22))
                        }
                    }
                    HStack(spacing: containerSpacing)  {
                        ForEach(8..<11) { index in
                            Button(tableStrings[index]) { withAnimation {
                                pressedNumberIndex = index
                            }  }
                                .buttonStyle(CandyButtonNonAnim(color: pressedNumberIndex == index ? .green : .red))
                                .frame(width: buttonFrameLast.width, height: buttonFrameLast.height, alignment: .center)
                                .font(.system(size: 22))
                        }
                    }
                }
                CandyText(text: "Select question count", color: .pink)
                HStack(spacing: 4) {
                    ForEach(0..<3,id: \.self) { index in
                        Button(questionCounts[index]) { withAnimation {
                            pressedIndexQuestion = index
                        }  }
                            .buttonStyle(CandyButtonNonAnim(color: pressedIndexQuestion == index ? .green : .red))
                            .frame(width: buttonFrameLast.width, height: buttonFrameLast.height, alignment: .center)
                            .font(.system(size: 22))
                    }
                }
                Spacer()
                Button("Start Exam") {
                    pressetStart = true
                    
                }
                    .buttonStyle(CandyButton(color: .blue))
                    .frame(width: 200, height: 100, alignment: .center)
                Spacer()
            }
        }
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
