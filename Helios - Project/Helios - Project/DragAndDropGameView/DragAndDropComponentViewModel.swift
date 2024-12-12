//
//  DragAndDropComponentViewModel.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import Foundation
import SwiftUI

@Observable
class DragAndDropComponentViewModel {
    var componentsList: [ComponentModel] {
        [
            ComponentModel(componentName: "diode", componentImage: "DiodeReal", componentDestinationImage: "DiodeDestination"),
            ComponentModel(componentName: "resistor", componentImage: "resistor", componentDestinationImage: "ResistorDestination"),
            ComponentModel(componentName: "connector", componentImage: "Connector", componentDestinationImage: "ConnectorDestination"),
            ComponentModel(componentName: "blueCapacitor", componentImage: "BlueCapacitor47", componentDestinationImage: "blueCapacitorDestination")
        ]
        
    }
    
    func handleDroppedComponents(droppedComponents: [ComponentModel], index: CGPoint? = nil, currentDestination: String) -> Bool {
        guard let firstComponent = droppedComponents.first else {
            return true
        }
        if firstComponent.componentName == currentDestination {
            print("Correct drop!")
            return true
        } else {
            print("Wrong drop!")
            return false
        }
    }
}
