//
//  ScoreGenerator.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import Combine
import Foundation

class ScoreGenerator: ObservableObject {
    
    @Published var targetValue = Int.random(in: 0...100)
    
    var currentValue = 0
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}
