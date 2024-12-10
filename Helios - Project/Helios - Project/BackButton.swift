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
                    Image("backButton")
                        .font(.system(size: 70))
                        .foregroundColor(isForegroundWhite ? .white : .black)
                    
                }
                .padding(.trailing, 700)
                
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
