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
        Card(cardLabel: "Electronic Components", cardImage: ["box"], cardBackground: .senape),
        Card(cardLabel: "Topic 2", cardImage: ["box"], cardBackground: .marroncino),
        Card(cardLabel: "Topic 3", cardImage: ["box"], cardBackground: .corallo),
        Card(cardLabel: "Topic 4", cardImage: ["box"], cardBackground: .rosino),
        Card(cardLabel: "Topic 5", cardImage: ["box"], cardBackground: .rossino)
    ]
}
