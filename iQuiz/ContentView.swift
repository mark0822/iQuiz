//
//  ContentView.swift
//  iQuiz
//
//  Created by Mark on 5/15/24.
//

import SwiftUI

struct Topic : Hashable{
    let name: String
    let description: String
    let id = UUID()
}

struct ContentView: View {
    let topics = [Topic(name: "Science!", description: "Because SCIENCE!"),Topic(name: "Mathematics", description: "Did you pass the third grade?"),Topic(name: "Marvel Super Heroes", description: "Avengers, Assemble!")]
    var body: some View {
        VStack {
            NavigationStack {
                List(topics, id: \.self) { topic in
                    NavigationLink{
                        questionView()
                    } label: {
                        VStack(alignment: .leading){
                            Label(topic.name, systemImage: "folder")
                            Text(topic.description)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement:
                        .topBarTrailing) {
                        Button("Settings") {
                            print("Settings clicked")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
