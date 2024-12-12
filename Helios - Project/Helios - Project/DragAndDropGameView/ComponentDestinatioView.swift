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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 300)
                .foregroundStyle(.white)
            Image(componentDestination.componentDestinationImage)
                .resizable()
                .frame(width: 235, height: 60)
        }
        .dropDestination(for: ComponentModel.self) { droppedComponent, index in
            viewModel.handleDroppedComponents(droppedComponents: droppedComponent, index: index, currentDestination: componentDestination.componentName)
            return true
        }
    }
}

#Preview {
    let viewModel = DragAndDropComponentViewModel()
    ComponentDestinatioView(componentDestination: .constant(viewModel.componentsList[0]))
}
