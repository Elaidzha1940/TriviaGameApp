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
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var
    }
}
