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
import SwiftUI

class TriviaManager: ObservableObject {
    
    private (set) var trivia: [Trivia.Result] = []
    @Published private (set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    @Published private (set) var answerselected = false
    @Published private (set) var question: AttributedString = ""
    @Published private (set) var answerChoices: [Answer]
    @Published private (set) var progress: CGFloat = 0.00
    @Published private (set) var score = 0
    
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
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Errror while fetching")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print("Error fetching trivis: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
             index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerselected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.ansewrs
            
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerselected = true
        
        if answer.isCorrect {
            score += 1 
        }
    }
}
