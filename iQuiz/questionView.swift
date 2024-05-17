//
//  questionView.swift
//  iQuiz
//
//  Created by Mark on 5/15/24.
//

import Foundation
import SwiftUI

struct questionView: View {
    @State var quiz: Quiz
    @State var index: Int
    @State private var selection: String?
    @State var correctAnswer: Int
    @State var questionsAnswered: Int
    
    var body: some View {
        let question = quiz.questions[index]
        NavigationStack {
            Text(question.text)
            List(question.answers, id: \.self, selection: $selection) { answer in
                Text(answer)
            }
            NavigationLink("Submit", destination: answerView(quiz: quiz, index: index, isCorrect: question.answers[Int(question.answer)!-1] == selection, correctAnswer: correctAnswer, questionsAnswered: questionsAnswered))
        }
    }
}

