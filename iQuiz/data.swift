//
//  data.swift
//  iQuiz
//
//  Created by Mark on 5/15/24.
//

import Foundation
import SwiftUI

let url = "http://tednewardsandbox.site44.com/questions.json"

//private func fetchRemoteData() {
//        let url = URL(string: url)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"  // optional
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let task = URLSession.shared.dataTask(with: request){ data, response, error in
//            if let error = error {
//                print("Error while fetching data:", error)
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode([Album].self, from: data)
//                // Assigning the data to the array
//                self.albums = decodedData
//            } catch let jsonError {
//                print("Failed to decode json", jsonError)
//            }
//        }
//
//        task.resume()
//    }
