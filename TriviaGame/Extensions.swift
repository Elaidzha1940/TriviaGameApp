//  /*
//
//  Project: TriviaGame
//  File: Extensions.swift
//  Created by: Elaidzha Shchukin
//  Date: 04.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import SwiftUI

extension Text {
    func lilactitle() -> some View {
        self.font(.system(size: 30, weight: .semibold, design: .serif))
            .foregroundColor(Color("AccentColor"))
    }
}
