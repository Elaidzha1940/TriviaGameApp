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
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        
        VStack(spacing: 40) {
            HStack {
                
                Text("Trivia Game")
                    .lilactitle()
                
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .font(.system(size: 15, weight: .semibold, design: .serif))
                    .foregroundColor(Color("AccentColor"))
            }
            
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text(triviaManager.question)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.gray)
                
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerselected ? Color("AccentColor") : Color(red: 0.02745098248, green: 0.08627450466, blue: 0.1058823466))
            }
            .disabled(!triviaManager.answerselected)
            
            Spacer() 
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8078432083, green: 0.78039217, blue: 0.7490196228))
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
