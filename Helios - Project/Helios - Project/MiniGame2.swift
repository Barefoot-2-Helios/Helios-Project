
//  MiniGame1.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFAudio

struct MiniGame2: View {
    
    @State var showSplash = true
    
 
    @Environment(PlayerModel.self) private var mediaPlayer
    @Environment(MillionaireGameViewModel.self) private var GameViewModel
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    @State private var points = 0
    @State private var selectedAnswer: String? = nil
    @State private var fillPercentage: CGFloat = 78
    
    @State private var answerList = ["DIODE", "CONNECTOR", "RESISTOR", "CAPACITOR" ]

    
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{

                
                VStack{
                    Spacer()
                    Image("DiodeReal")
                        .font(.system(size: 100))
                        .offset(x:10, y:-70)


                    
                    Image(systemName: "speaker.wave.3")
                        .foregroundStyle(.white)
                        .font(.system(size: 100))
                        .onAppear(){
                            GameViewModel.startGame()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                mediaPlayer.playAudio(fileName: "Diode3D", fileExtension: "mp3")
                            }
                            
                        }
                        .padding(.bottom, 70)
                        .onTapGesture {
                            mediaPlayer.playAudio(fileName: GameViewModel.correctAnswer , fileExtension: "mp3")
                        }
        
                    
                    
//                    Spacer()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 50) {
                        ForEach(answerList, id: \.self) { answer in
                            Button(action: {
                                selectedAnswer = answer
                                if selectedAnswer == "DIODE"  {
                                    fillPercentage = fillPercentage + 25
                                    if(fillPercentage >= 100){
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            GameViewModel.selectedAnswers = []
                                            showDetail = true
                                            fillPercentage = 0
                                        }
                                    } else {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            
                                            
                                            GameViewModel.startGame()
                                            mediaPlayer.playAudio(fileName: "Diode3D" , fileExtension: "mp3")
                                            selectedAnswer = ""
                                        }
                                    }
                                }
                            }) {
                                //TO CHANGE WITH RIGHT ASSET FOR
                                ZStack{
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 350, height: 225)
                                            .overlay( // Bordo opzionale per aggiungere un effetto più evidente
                                                RoundedRectangle(cornerRadius: 30)
                                                    .fill(selectedAnswer == answer
                                                          ? (answer == "DIODE" ? Color.green : Color.red)
                                                          : Color.white) // Solo il selezionato cambia colore
                                            )
                                    }
                                     Text(answer)
                                        .font(.system(size: 40))
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        
                    }.padding()
                    .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: BackButton( isForegroundWhite: true))
                        .navigationDestination(isPresented: $showDetail) { Liv2View()}
                  
                    
                    
                }
            }
            
        }
        
   }
  
}



#Preview {
    MiniGame2()
        .environment(PlayerModel())
        .environment(MillionaireGameViewModel())
}

