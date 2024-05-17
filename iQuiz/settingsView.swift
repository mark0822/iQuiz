//
//  settingsView.swift
//  iQuiz
//
//  Created by Mark on 5/17/24.
//

import Foundation
import SwiftUI

struct settingsView: View {
    @Binding var quizzes: [Quiz]
    @State private var url: String = ""
    @State private var networkAlert = false
    
    func fetchData(url: String) {
        guard let url = URL(string: url) else {
            self.networkAlert = true
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.networkAlert = true
                return
            }
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
        TextField(
            "Enter url here",
            text: $url
        ).multilineTextAlignment(.center).padding()
        Button("check now"){
            fetchData(url: url)
            print(quizzes[0])
        }
        .alert(isPresented: $networkAlert, content: {
            Alert(title:Text("Network Issue"))
        })
    }
}


