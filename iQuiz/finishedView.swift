//
//  finishedView.swift
//  iQuiz
//
//  Created by Mark on 5/17/24.
//

import Foundation
import SwiftUI

struct finishedView: View {
    @State var correctAnswer: Int
    @State var questionsAnswered: Int
    
    var body: some View {
        NavigationStack {
            if correctAnswer == questionsAnswered {
                Text("Perfect").padding()
            } else {
                Text("Almost").padding()
            }
            Text("\(correctAnswer) of \(questionsAnswered) correct").padding()
            NavigationLink("Next", destination: ContentView()).padding()
        }
        
    }
}
