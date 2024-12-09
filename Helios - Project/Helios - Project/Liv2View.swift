//  Liv1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFoundation

struct Liv2View: View {
    
    @Environment(PlayerModel.self) private var mediaPlayer
    @State private var audioPlayer: AVAudioPlayer?
    @State private var timer: Timer?
    @State private var showDetail = false
    @State private var isForegroundWhite = true
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    
    var body: some View {
        ZStack{
            Color.senape.ignoresSafeArea()
            VStack{
                VStack{
                    HStack {
                        Image(systemName: "arrowtriangle.backward")
                            .font(.system(size: 70))
                            .foregroundColor(isForegroundWhite ? .white : Color("giallino"))
                        
                        ZStack {
                            Circle()
                                .frame(width: 100)
                                .foregroundStyle(.white)
                            
                            Image("house")
                                .resizable()
                                .frame(width: 75, height: 55)
                        } .onTapGesture {
                            showDetail = true
                        }
                        .fullScreenCover(isPresented: $showDetail) {
                            SplashScreenView()
                        }
                    }
                    .padding(.leading, 850)
                }.navigationBarBackButtonHidden(true)
                
                Spacer()
                
                Text("Liv 2")
                    .fontWeight(.semibold)
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                
                Image("Connector")
                    .frame(width: 200, height: 200)
                Text("Work In Progress")
                    .fontWeight(.semibold)
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    Liv2View()
        .environment(PlayerModel())

}
