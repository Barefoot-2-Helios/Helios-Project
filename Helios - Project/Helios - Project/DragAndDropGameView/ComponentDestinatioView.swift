//
//  ComponentDestinatioView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct ComponentDestinatioView: View {
    @Binding var componentDestination: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.giallino)
            Image(componentDestination)
        }
    }
}

#Preview {
    ComponentDestinatioView(componentDestination: .constant("DiodeDestination"))
}
