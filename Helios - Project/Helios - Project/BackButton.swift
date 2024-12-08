//
//  BackButton.swift
//  Helios - Project
//
//  Created by Renato Ferrara on 08/12/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss // Access to dismiss the view

    var isForegroundWhite: Bool // Passed when the view is initialized

    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Spacer()
                HStack {
                    Image(systemName: "arrowtriangle.backward")
                        .font(.system(size: 70))
                        .foregroundColor(isForegroundWhite ? .white : Color("giallino"))
                    ZStack {
                        Circle()
                            .frame(width: 100)
                            .foregroundStyle(isForegroundWhite ? .white : Color("giallino"))
                        Image("house")
                            .resizable()
                            .frame(width: 75, height: 55)
                    }
                }
                .padding(.trailing, 40)
            }
        }
    }
}

#Preview {
    VStack {
        BackButton(isForegroundWhite: false)  // White foreground
        BackButton(isForegroundWhite: true) // "Giallino" foreground
    }
}
