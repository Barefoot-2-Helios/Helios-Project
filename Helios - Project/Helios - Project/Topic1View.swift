//
//  Topic1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI

struct Topic1View: View {
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{
                
                BackButton(isForegroundWhite: true)
      
                ScrollView(.vertical) {
                    
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 220)
                                
                            VStack{
                                Text("Liv 1")
                                Image("liv1")
                            }
                        }.padding(.leading, 100)
                        
                        .onTapGesture {
                            showDetail = true
                        }
                        .fullScreenCover(isPresented: $showDetail) {
                            Liv1View()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 220)
                            VStack{
                                Text("Liv 2")
                                Image("liv2")
                            }
                        }                                .padding(.trailing, 100)

                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 220)
                            .padding(.leading, 100)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Circle()
                            .foregroundStyle(.white
                            )
                            .frame(width: 220)
                            .padding(.trailing, 100)
                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 220)
                            .padding(.leading, 100)
                        Spacer()
                    }
            }
                    
                }
            }
        }
    }


#Preview {
    Topic1View()
}
