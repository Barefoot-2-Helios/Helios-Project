//
//  DragAndDropGameView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct DragAndDropGameView: View {
    var componentViewModel = DragAndDropComponentViewModel()
    
    var body: some View {
        VStack {
            StartingComponentView(startingComponent: .constant(componentViewModel.componentsList[0]))
            HStack {
                ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[0]))
                ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[1]))
            }
        }
    }
}

#Preview {
    DragAndDropGameView()
}
