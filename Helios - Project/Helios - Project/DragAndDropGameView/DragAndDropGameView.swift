//
//  DragAndDropGameView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct DragAndDropGameView: View {
    var body: some View {
        VStack {
            StartingComponentView(startingComponent: .constant("DiodeReal"))
            HStack {
                ComponentDestinatioView(componentDestination: .constant("DiodeDestination"))
                ComponentDestinatioView(componentDestination: .constant("ResistorDestination"))
            }
        }
    }
}

#Preview {
    DragAndDropGameView()
}
