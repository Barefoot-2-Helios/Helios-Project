//
//  ComponentView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct StartingComponentView: View {
    @Binding var startingComponent: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.rossino)
            Image(startingComponent)
        }
    }
}

#Preview {
    StartingComponentView(startingComponent: .constant("DiodeReal"))
}
