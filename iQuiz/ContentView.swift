//
//  ContentView.swift
//  iQuiz
//
//  Created by Mark on 5/15/24.
//

import SwiftUI

struct Quiz : Codable, Hashable{
    let title: String
    let desc: String
    let questions: [Question]
}

struct Question : Codable, Hashable{
    let text: String
    let answer: String
    let answers: [String]
}


struct ContentView: View {
    @State var quizzes: [Quiz] = []
    @State var flag = false
    private var url = "https://tednewardsandbox.site44.com/questions.json"
    
    func fetchData(url: String) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
                DispatchQueue.main.async {
                    self.quizzes = quizzes
                }
            } catch {
                print(String(describing: error))
            }
        }.resume()
    }
    
    
    var body: some View {
        VStack {
            NavigationStack {
                List(quizzes, id: \.self) { quiz in
                    NavigationLink{
                        questionView(quiz: quiz, index: 0, correctAnswer: 0, questionsAnswered: 0)
                    } label: {
                        VStack(alignment: .leading){
                            Label(quiz.title, systemImage: "folder")
                            Text(quiz.desc)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Settings", destination: settingsView(quizzes: $quizzes))
                    }
                }
            }
            .onAppear {
                guard !flag else{return}
                flag = true
                fetchData(url: url)
            }
        }
    }
}

#Preview {
    ContentView()
}
