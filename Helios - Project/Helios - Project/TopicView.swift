//
//  TopicView.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI

struct TopicView: View {
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false

    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Spacer()
                        HStack{
                            Image(systemName: "arrowtriangle.backward")
                                .font(.system(size: 70))
                                .foregroundColor(.giallino)
                            ZStack{
                                Circle()
                                    .frame(width: 100)
                                    .foregroundStyle(.giallino)
                                Image("house")
                                    .resizable()
                                    .frame(width: 75, height: 55)
                            }
                        }
                        .padding(.trailing, 40)

                    }
                }
                ScrollView(.vertical) {
                    
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.senape)
                                .frame(width: 220)
                            Text("Topic 1")
                        }                                .padding(.leading, 100)

                        .onTapGesture {
                            showDetail = true
                        }
                        .fullScreenCover(isPresented: $showDetail) {
                            Topic1View()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.marroncino)
                                .frame(width: 220)
                            Text("Topic 2")
                        }                                .padding(.trailing, 100)

                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.corallo)
                            .frame(width: 220)
                            .padding(.leading, 100)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Circle()
                            .foregroundStyle(.rosino)
                            .frame(width: 220)
                            .padding(.trailing, 100)
                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.rossino)
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
    TopicView()
}
