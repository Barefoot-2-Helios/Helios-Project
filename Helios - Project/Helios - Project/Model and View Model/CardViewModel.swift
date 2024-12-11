//
//  CardViewModel.swift
//  Helios - Project
//
//  Created by Letizia Granata on 10/12/24.
//

import Foundation
import SwiftUI

class CardViewModel: ObservableObject {
    @Published var cards: [Card] = [
        Card(cardLabel: "This is card 1", cardImage: ["house", "house"], cardBackground: .senape),
        Card(cardLabel: "This is card 2", cardImage: ["house", "house"], cardBackground: .blue),
        Card(cardLabel: "This is card 3", cardImage: ["house", "house"], cardBackground: .yellow),
        Card(cardLabel: "This is card 4", cardImage: ["house", "house"], cardBackground: .orange),
        Card(cardLabel: "This is card 5", cardImage: ["house", "house"], cardBackground: .purple),
        Card(cardLabel: "This is card 6", cardImage: ["house", "house"], cardBackground: .cyan)
    ]
}
