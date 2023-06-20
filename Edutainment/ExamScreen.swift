//
//  ExamScreen.swift
//  Edutainment
//
//  Created by Oguzhan Ozturk on 8.06.2023.
//

import SwiftUI

struct ExamScreen: View {
    
    @ObservedObject var examVM: ExamScreenViewModel
    
    @State var questionStr = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color(.sRGB, red: 0.0, green: 0.5, blue: 1, opacity: 0.2)
                VStack(alignment: .leading) {
                    Text("Question: \(examVM.currentQuestion.0)")
                        .font(.system(size: 24))
                    Spacer()
                    Divider()
                    Text(questionStr)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(5.0)
            }.frame(width: UIScreen.screenWidth - 50, height: 200, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    ForEach(1..<4,id: \.self) { index in
                        Button("\(index)") {
                            questionStr += "\(index)"
                        }
                        .buttonStyle(CandyButton(color: .brown))
                    }
                }
                HStack(spacing: 10) {
                    ForEach(4..<7,id: \.self) { index in
                        Button("\(index)") {
                            questionStr += "\(index)"
                        }
                        .buttonStyle(CandyButton(color: .brown))
                    }
                }
                HStack(spacing: 10) {
                    ForEach(7..<10,id: \.self) { index in
                        Button("\(index)") {
                            questionStr += "\(index)"
                        }
                        .buttonStyle(CandyButton(color: .brown))
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .center)
            Button("DEL") {
                if questionStr == "" {} else { questionStr.removeLast() }
            }
            .buttonStyle(CandyButton(color: .brown))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .frame(height: 100)
            Button("OK") {
                questionStr = ""
                examVM.nextQuestion()
            }
            .buttonStyle(CandyButton(color: .brown))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .frame(height: 100)
            //Spacer()
        }
        
    }
    
}


struct ExamScreen_previews: PreviewProvider {
    static var previews: some View {
        ExamScreen(examVM: ExamScreenViewModel(questionCount: "5", multiplyChar: "5"))
    }
}
