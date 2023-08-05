//  /*
//
//  Project: TriviaGame
//  File: AnswerRow.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct AnswerRow: View {
    
    var answer: Answer
    
    var body: some View {
        
        HStack{
            
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Some", isCorrect: false))
    }
}
