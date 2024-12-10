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
                    .offset(x:10, y:-210)
                
                VStack{
                    
                    Image(systemName: "speaker.wave.3")
                        .offset(x:10, y:-150)
                        .font(.system(size: 100))
                        .onAppear(){
                            GameViewModel.startGame()
                             mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "mp3")
                            
                        }.onTapGesture {
                            mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "mp3")
                        }
                    
                    LinearProgress(progress: self.fillPercentage, foregroundColor: Color.green)
                        .clipShape(Capsule())
                        .frame(height: 100)
                        .padding()
                        .offset(x:10, y:-130)

                    
                    
                
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(GameViewModel.showedAnswers, id: \.self) { answer in
                            Button(action: {
                                selectedAnswer = answer
                                if selectedAnswer == GameViewModel.correctAnswer {
                                    fillPercentage = fillPercentage + 25
                                    if(fillPercentage >= 100){
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            GameViewModel.selectedAnswers = []
                                            showDetail = true
                                            fillPercentage = 0
                                        }
                                    } else {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            
                                            
                                            GameViewModel.startGame()
                                            mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "mp3")
                                            selectedAnswer = ""
                                        }
                 }
                                }
                            }) {
                                //TO CHANGE WITH RIGHT ASSET FOR IMAGES
                                Image("DiodeReal")
                                    .padding(15)
                                    .background(selectedAnswer == answer ?
                                                (answer == GameViewModel.correctAnswer ? Color.green : Color.red)
                                                : Color.white)
                                    .foregroundColor(.white)
                             }
                        }
                        
                    }
                    .offset(x:10, y:130)

                    
                }.fullScreenCover(isPresented: $showDetail) {
                    Liv2View()
                    
                }
            }
            
        }
        
   }
  
}



#Preview {
    MiniGame1()
        .environment(PlayerModel())
        .environment(MillionaireGameViewModel())
}
