//  /*
//
//  Project: TriviaGame
//  File: Trivia.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

struct Trivia: Decodable {
    
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswer: [String]
        
        var formattedQuestion: AttributedString {
            do {
              return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var ansewrs: [Answer]  {
            do {
              let correct = Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)
                
            } catch {
                print("Error setting ansewrs: \(error)")
                return[]

            }
        }
    }
}
