//
//  MiniGame1.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFAudio

struct MiniGame1: View {
    
    
    @State var showSplash = true
    
    @Environment(PlayerModel.self) private var mediaPlayer
    @Environment(MillionaireGameViewModel.self) private var GameViewModel
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    @State private var points = 0
    @State private var selectedAnswer: String? = nil
    
    @State private var fillPercentage: CGFloat = 78
    
    
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{
                
                
                VStack{
                    Spacer()
                    Group{
                        Text("DIODE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 100))
                        
                        
                        Image(systemName: "speaker.wave.3")
                            .font(.system(size: 100))
                            .foregroundStyle(.white)
                            .padding(.top, 15)
                    }
                    .onAppear(){
                        GameViewModel.startGame()
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            mediaPlayer.playAudio(fileName: "Diode3D", fileExtension: "mp3")
                        }
                        
                        
                    }
                    .onTapGesture {
                        mediaPlayer.playAudio(fileName: "Diode3D", fileExtension: "mp3")
                    }
                    
                    Spacer()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                        ForEach(GameViewModel.showedAnswers, id: \.self) { answer in
                            Button(action: {
                                selectedAnswer = answer
                                if selectedAnswer == "Diode3D" {
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
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 350, height: 225)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(selectedAnswer == answer
                                                      ? (answer == "Diode3D" ? Color.green : Color.red)
                                                      : Color.white)
                                        )
                                    
                                    Image(answer)
                                }.padding(.bottom, 20)
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
            .navigationDestination(isPresented: $showDetail) { MiniGame1_5()}
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton( isForegroundWhite: true))
            
        }
    }
    
    
}
        


#Preview {
    MiniGame1()
        .environment(PlayerModel())
        .environment(MillionaireGameViewModel())
}
