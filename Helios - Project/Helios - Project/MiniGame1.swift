//
//  MiniGame1.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFAudio

struct MiniGame1: View {
  
    @Environment(PlayerModel.self) private var mediaPlayer
    @Environment(MillionaireGameViewModel.self) private var GameViewModel
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    @State private var points = 0
    @State private var selectedAnswer: String? = nil
    @State private var fillPercentage: CGFloat = 1
    
    
    
    
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{
                BackButton(isForegroundWhite: true)
                
                VStack{
                    Spacer()
                    LinearProgress(progress: self.fillPercentage, foregroundColor: Color.green)
                        .clipShape(Capsule())
                        .frame(height: 50)
                        .padding()
                    
                    
                    Image(systemName: "speaker.wave.3")
                        .padding(50)
                        .font(.system(size: 100))
                        .onAppear(){
                            GameViewModel.startGame()
                            mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "m4a")
                            
                        }.onTapGesture {
                            mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "m4a")
                        }
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(GameViewModel.showedAnswers, id: \.self) { answer in
                            Button(action: {
                                selectedAnswer = answer
                                if selectedAnswer == GameViewModel.correctAnswer {
                                    // Shuffle and reload new answers on correct selection
                                    GameViewModel.startGame()
                                    mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "m4a")
                                    fillPercentage = fillPercentage + 25
                                    if(fillPercentage >= 100){
                                        GameViewModel.selectedAnswers = []
                                        showDetail = true
                                        fillPercentage = 0
                                        
                                    }
                                }
                            }) {
                                //TO CHANGE WITH RIGHT ASSET FOR IMAGES
                                Text(answer)
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .padding()
                                    .background(selectedAnswer == answer ?
                                                (answer == GameViewModel.correctAnswer ? Color.green : Color.red)
                                                : Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                    }
                    Spacer()
                }
               
            }
            
        }
        
    }
    
}



//#Preview {
//    MiniGame1(namespace: ., card: <#Card#>)
//        .environment(PlayerModel())
//        .environment(MillionaireGameViewModel())
//}
