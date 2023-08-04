//  /*
//
//  Project: TriviaGame
//  File: ProgressBar.swift
//  Created by: Elaidzha Shchukin
//  Date: 04.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct ProgressBar: View {
    
    var progress: CGFloat
    var body: some View {
        
        ZStack(alignment: .leading) {
            
             Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(red: 0.8078432083, green: 0.78039217, blue: 0.7490196228))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)

        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 50)
    }
}
