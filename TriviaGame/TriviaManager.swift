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
    
    func fetchTrivia() async {
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") {}
        
            let urlRequest = URLRequest 
    }
}
