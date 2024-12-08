//
//  MiniGame1.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI

struct MiniGame1: View {
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    
    var body: some View {
        ZStack{
            Color.senape.ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Spacer()
                        HStack{
                            Image(systemName: "arrowtriangle.backward")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                            ZStack{
                                Circle()
                                    .frame(width: 100)
                                    .foregroundStyle(.white)
                                Image("house")
                                    .resizable()
                                    .frame(width: 75, height: 55)
                            }
                        }
                        .padding(.trailing, 40)
                    }
                }
                Spacer()
                Text("MINIGAME1")
                Spacer()
            }
        }
    }
}

#Preview {
    MiniGame1()
}
