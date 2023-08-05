//  /*
//
//  Project: TriviaGame
//  File: TriviaManager.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

class TriviaManager: ObservableObject {
    
    private (set) var trivia: [Trivia.Result] = []
    @Published private (set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    @Published private (set) var answerselected = false
    @Published private (set) var question: AttributedString = ""
    @Published private (set) var 
    
    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Errror while fetching")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            try decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length =  self.trivia.count
            }
            
        } catch {
            print("Error fetching trivis: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
             index += 1
            
        } else {
            reachedEnd = true
        }
    }
}
