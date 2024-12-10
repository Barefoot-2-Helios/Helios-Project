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
            ComponentModel(componentName: "diode", componentImage: "diodeReal", componentDestinationImage: "diodeDestination"),
            ComponentModel(componentName: "resistor", componentImage: "resistor", componentDestinationImage: "resistorDestination"),
            ComponentModel(componentName: "connector", componentImage: "Connector", componentDestinationImage: "connectorDestination"),
            ComponentModel(componentName: "blueCapacitor", componentImage: "BlueCapacitor47", componentDestinationImage: "blueCapacitorDestination")
        ]
        
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
