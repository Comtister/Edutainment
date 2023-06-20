//
//  ExamScreenViewModel.swift
//  Edutainment
//
//  Created by Oguzhan Ozturk on 9.06.2023.
//

import Foundation

final class ExamScreenViewModel: ObservableObject {
    
    private let questionCount: Int
    private let multiplyChar: Int
    
    private var questions: [(String, Int)] = []
    @Published
    var currentQuestion: (String, Int)!
    private var questionIndex = 0
    
    init(questionCount: String, multiplyChar: String) {
        let count = Int(questionCount) ?? 5
        let multiply = Int(String(multiplyChar.first ?? "2")) ?? 2
        self.questionCount = count
        self.multiplyChar = multiply
        calculateQuestions()
        currentQuestion = questions[questionIndex] //İmportant line
        questionIndex += 1
    }
    
    private func calculateQuestions() {
        for _ in 0..<questionCount {
            let randomInt = Int.random(in: 1..<21)
            let question = "\(multiplyChar)X\(randomInt)"
            let questionAnswer = multiplyChar * randomInt
            questions.append((question, questionAnswer))
        }
    }
    
    func nextQuestion() {
        defer { questionIndex += 1 }
        if questionIndex >= questionCount { return }
        currentQuestion = questions[questionIndex]
    }
    
}
