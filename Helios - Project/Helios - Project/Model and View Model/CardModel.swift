//
//  CardModel.swift
//  Helios - Project
//
//  Created by Letizia Granata on 10/12/24.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let cardLabel: String
    let cardImage: [String]
    let cardBackground: Color
}
