//
//  ComponentDestinatioView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct ComponentDestinatioView: View {

    var viewModel = DragAndDropComponentViewModel()
    
    @Binding var componentDestination: ComponentModel
    @State var startingComponent: ComponentModel?
    @State private var buttonColor: Color = .white
    
    @Binding var correctAnswer: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 300)
                .foregroundStyle(buttonColor)
            Image(componentDestination.componentDestinationImage)
                .resizable()
                .frame(width: 235, height: 60)
        }
        .dropDestination(for: ComponentModel.self) { droppedComponent, index in
            correctAnswer = viewModel.handleDroppedComponents(droppedComponents: droppedComponent, index: index, currentDestination: componentDestination.componentName)
            if correctAnswer == true {
                buttonColor = .green
            } else {
                buttonColor = .red
            }
            return true
        }
    }
}

#Preview {
    let viewModel = DragAndDropComponentViewModel()
    ComponentDestinatioView(componentDestination: .constant(viewModel.componentsList[0]), correctAnswer: .constant(false))
}
