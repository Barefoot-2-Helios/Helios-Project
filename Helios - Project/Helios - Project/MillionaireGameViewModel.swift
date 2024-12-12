//
//  MillionaireGameViewModel.swift
//  Helios - Project
//
//  Created by Renato Ferrara on 08/12/24.
//



import AVFoundation
import Observation
import SwiftUI

@Observable
class MillionaireGameViewModel {
    var answersList = ["Capacitor3D", "Diode3D", "Connector3D", "Resistor3D"]
     var showedAnswers: [String] = []
    var correctAnswer : String
    var selectedAnswers : [String] = []
    var fillPercentage: CGFloat = 1


    init() {
        self.answersList = ["Capacitor3D", "Diode3D", "Connector3D", "Resistor3D"]
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
