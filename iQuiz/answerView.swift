//
//  answerView.swift
//  iQuiz
//
//  Created by Mark on 5/17/24.
//

import Foundation
import SwiftUI

struct answerView: View {
    @State var quiz: Quiz
    @State var index: Int
    @State var isCorrect: Bool
    @State var correctAnswer: Int
    @State var questionsAnswered: Int
    
    var body: some View {
        let question = quiz.questions[index]
        NavigationStack {
            Text(question.text).padding()
            Text("Correct Answer: " + question.answers[Int(question.answer)!-1]).padding()
            if isCorrect {
                Text("Your answer is correct").padding()
                
            } else {
                Text("Your answer is incorrect").padding()
            }
            if(quiz.questions.count > index+1){
                if isCorrect {
                    NavigationLink("Next", destination: questionView(quiz: quiz, index: index + 1, correctAnswer: correctAnswer + 1, questionsAnswered: questionsAnswered + 1))
                } else {
                    NavigationLink("Next", destination: questionView(quiz: quiz, index: index + 1, correctAnswer: correctAnswer, questionsAnswered: questionsAnswered + 1))
                }
            } else {
                if isCorrect {
                    NavigationLink("Next", destination: finishedView(correctAnswer: correctAnswer + 1, questionsAnswered: questionsAnswered + 1))
                } else {
                    NavigationLink("Next", destination: finishedView(correctAnswer: correctAnswer, questionsAnswered: questionsAnswered + 1))
                }
            }
        }
    }
}
