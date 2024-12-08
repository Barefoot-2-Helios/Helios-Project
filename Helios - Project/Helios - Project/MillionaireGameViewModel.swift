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
    var answersList = ["Capacitor", "Diode", "Connector", "Resistor", "DrumCoil"]
    var showedAnswers: [String] = []
    var correctAnswer : String
    var selectedAnswers : [String] = []
    var fillPercentage: CGFloat = 1


    init() {
        self.answersList = ["Capacitor", "Diode", "Connector", "Resistor", "DrumCoil"]
        self.showedAnswers = []
        self.correctAnswer = ""
    }
 
    
    func startGame() {
           // Shuffle the list to ensure randomness
           self.answersList = answersList.shuffled()

           // Select the correct answer randomly
        repeat {
            correctAnswer = answersList.randomElement()!
        } while selectedAnswers.contains(correctAnswer)
        selectedAnswers.append(correctAnswer)

           // Get the first 3 answers from the shuffled list excluding the correct answer
        var tempAnswers = answersList.filter { answer in
          answer != correctAnswer
        }.prefix(3)
           // Add the correct answer to the temporary list
           tempAnswers.append(correctAnswer)

           // Shuffle `tempAnswers` to mix the correct answer with distractors
           showedAnswers = tempAnswers.shuffled()
        
       }
}
