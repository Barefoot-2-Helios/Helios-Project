//
//  DragGameView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 11/12/24.
//

//
//  Minigame2.swift
//  Helios - Project
//
//  Created by Letizia Granata on 11/12/24.
//

import SwiftUI

struct DragGameView: View {
    
    @Environment(DragAndDropComponentViewModel.self) private var componentViewModel
    
    @State private var points = 0
    @State private var selectedAnswer: String? = nil
    @State private var fillPercentage: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{
                BackButton(isForegroundWhite: true)
                VStack {
                    Spacer()
                    ZStack{
                        StartingComponentView(startingComponent: .constant(componentViewModel.componentsList[0]))
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack{
                            ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[0]))
                        }
                        Spacer()
                        ZStack{
                            ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[1]))
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .onAppear{
            componentViewModel.startGame()
        }
    }
}

#Preview {
    DragGameView()
        .environment(DragAndDropComponentViewModel())
}
