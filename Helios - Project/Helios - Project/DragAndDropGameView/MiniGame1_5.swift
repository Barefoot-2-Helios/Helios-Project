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

struct MiniGame1_5: View {
    
    @State private var showDetail = false
    
    @State private var correctAnswer = false
    
    @Environment(DragAndDropComponentViewModel.self) private var componentViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.senape.ignoresSafeArea()
                VStack{
                    VStack {
                        Spacer()
                        ZStack{
                            StartingComponentView(startingComponent: .constant(componentViewModel.componentsList[0]))
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack{
                                ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[0]), correctAnswer: $correctAnswer)
                            }
                            Spacer()
                            ZStack{
                                ComponentDestinatioView(componentDestination: .constant(componentViewModel.componentsList[1]), correctAnswer: $correctAnswer)
                            }
                            Spacer()
                        }.padding(.bottom, 40)
//                        Spacer()
                    }
                }
            }
            .navigationDestination(isPresented: $correctAnswer) { MiniGame2()}
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton( isForegroundWhite: true))
        }
    }
}

#Preview {
    MiniGame1_5()
        .environment(DragAndDropComponentViewModel())
}
