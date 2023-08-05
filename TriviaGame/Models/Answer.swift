//  /*
//
//  Project: TriviaGame
//  File: Answer.swift
//  Created by: Elaidzha Shchukin
//  Date: 04.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text = AttributedString()
    var isCorrect = Bool 
}
