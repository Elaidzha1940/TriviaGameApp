//  /*
//
//  Project: TriviaGame
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 04.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    
                    Text("Trivia Game")
                        .lilactitle()
                    
                    Text("Are you ready  to test out your trivia skills ?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's Go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.8078432083, green: 0.78039217, blue: 0.7490196228))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

