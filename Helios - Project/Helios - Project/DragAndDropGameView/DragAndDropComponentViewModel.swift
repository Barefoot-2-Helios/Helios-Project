//
//  DragAndDropComponentViewModel.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import Foundation

@Observable
class DragAndDropComponentViewModel {
    var componentsList: [ComponentModel] {
        [
            ComponentModel(componentName: "diode", componentImage: "diodeReal", componentDestinationImage: "DiodeDestination"),
            ComponentModel(componentName: "resistor", componentImage: "resistor", componentDestinationImage: "ResistorDestination"),
            ComponentModel(componentName: "connector", componentImage: "Connector", componentDestinationImage: "ConnectorDestination"),
            ComponentModel(componentName: "blueCapacitor", componentImage: "BlueCapacitor47", componentDestinationImage: "blueCapacitorDestination")
        ]
        
    }
    
    var answersList = ["diode", "resistor", "connector", "blueCapacitor"]
    var showedAnswers: [String] = []
    var correctAnswer : String
    var selectedAnswers : [String] = []
    var fillPercentage: CGFloat = 1
    
    init() {
        self.answersList = ["diode", "resistor", "connector", "blueCapacitor"]
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
        
        // Get the first answer from the shuffled list excluding the correct answer
        var tempAnswers = answersList.filter { answer in
            answer != correctAnswer
        }.prefix(1)
        // Add the correct answer to the temporary list
        tempAnswers.append(correctAnswer)
        
        // Shuffle `tempAnswers` to mix the correct answer with distractors
        showedAnswers = tempAnswers.shuffled()
    }
    
    func handleDroppedComponents(droppedComponents: [ComponentModel], index: CGPoint? = nil, currentDestination: String) {
        guard let firstComponent = droppedComponents.first else {
            return
        }
        if firstComponent.componentName == currentDestination {
            print("Correct drop!")
        } else {
            print("Wrong drop!")
        }
    }
}
