//  /*
//
//  Project: TriviaGame
//  File: QuestionView.swift
//  Created by: Elaidzha Shchukin
//  Date: 04.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct QuestionView: View {
    var body: some View {
        
        VStack(spacing: 40) {
            HStack {
                
                Text("Trivia Game")
                    .lilactitle()
                
                Spacer()
                
                Text("1 out of 10")
                    .font(.system(size: 15, weight: .semibold, design: .serif))
                    .foregroundColor(Color("AccentColor"))
            }
            
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Which of the following is not the name of a &quot;Bond Girl&quot;?")
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.gray)
                
                AnswerRow(answer: Answer(text: "false", isCorrect: true))
                AnswerRow(answer: Answer(text: "true", isCorrect: false))
                 
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8078432083, green: 0.78039217, blue: 0.7490196228))
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
