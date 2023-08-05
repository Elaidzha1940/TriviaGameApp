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
    @State private var isSelected = false
    
    var green = Color(#colorLiteral(red: 0.1764705926, green: 0.6666666865, blue: 0.2588235438, alpha: 1))
    var red = Color(#colorLiteral(red: 0.8268612027, green: 0.08678960055, blue: 0.1595013738, alpha: 1))
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .font(.system(size: 15, weight: .semibold, design: .serif))

            if isSelected  {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red )
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ? Color("AccentColor") : .gray)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Some", isCorrect: false))
    }
}
