//
//  Minigame2.swift
//  Helios - Project
//
//  Created by Letizia Granata on 11/12/24.
//

import SwiftUI

struct Minigame2: View {
    var body: some View {
        ZStack {
            Color.senape.ignoresSafeArea()
            VStack{
                BackButton(isForegroundWhite: true)
                VStack {
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 370, height: 350)
                            .foregroundStyle(.white)
                        Image("Diodelg")
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 300, height: 300)
                                .foregroundStyle(.white)
                            Image("slotdiodelg")
                                .resizable()
                                .frame(width: 235, height: 60)
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 300, height: 300)
                                .foregroundStyle(.white)
                            Image("slotr1lg")
                                .resizable()
                                .frame(width: 245, height: 65)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Minigame2()
}
