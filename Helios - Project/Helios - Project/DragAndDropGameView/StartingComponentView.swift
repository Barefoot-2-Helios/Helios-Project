//
//  ComponentView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct StartingComponentView: View {
    @Binding var startingComponent: ComponentModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 370, height: 310)
                .foregroundStyle(.white)
            Image(startingComponent.componentImage)
                .resizable()
                .frame(width: 300, height: 90)
                .draggable(startingComponent)
                
        }
    }
}

#Preview {
    let viewModel = DragAndDropComponentViewModel()
    StartingComponentView(startingComponent: .constant(viewModel.componentsList[0]))
}
