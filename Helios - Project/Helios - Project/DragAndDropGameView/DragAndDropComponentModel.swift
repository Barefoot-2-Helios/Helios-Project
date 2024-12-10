//
//  DragAndDropComponentModel.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 10/12/24.
//

import SwiftUI

struct ComponentModel: Codable {
    var id = UUID()
    var componentName: String
    var componentImage: String
    var componentDestinationImage: String
}

extension ComponentModel: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .component)
        ProxyRepresentation(exporting: \.componentName)
        
    }
}

