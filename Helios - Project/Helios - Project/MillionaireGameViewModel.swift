//
//  MillionaireGameViewModel.swift
//  Helios - Project
//
//  Created by Renato Ferrara on 08/12/24.
//

import Foundation
import AVFoundation
import Observation
import SwiftUI

@Observable
class MillionaireGameViewModel {
    var answersList = ["Capacitor47", "Diode", "DrumCoilMaybe", "resistor", "Connector", "BlueCapacitor47", "house"]
    var showedAnswers: [String] = []
    var correctAnswer : String
    var selectedAnswers : [String] = []
    var fillPercentage: CGFloat = 1


    init() {
        self.answersList = ["Capacitor47", "Diode", "DrumCoilMaybe", "resistor", "Connector", "BlueCapacitor47", "house"]
        self.showedAnswers = []
        self.correctAnswer = ""
    }
 
    
    func startGame() {
           // Shuffle the list to ensure randomness
           self.answersList = answersList.shuffled()

           // Select the correct answer randomly
           correctAnswer = answersList.randomElement()!
            selectedAnswers.append(correctAnswer)

           // Get the first 3 answers from the shuffled list excluding the correct answer
        var tempAnswers = answersList.filter { answer in
            !selectedAnswers.contains(answer) && answer != correctAnswer
        }.prefix(3)
           // Add the correct answer to the temporary list
           tempAnswers.append(correctAnswer)

           // Shuffle `tempAnswers` to mix the correct answer with distractors
           showedAnswers = tempAnswers.shuffled()
        
       }
}
