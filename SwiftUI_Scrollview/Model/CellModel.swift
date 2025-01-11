//
//  CellModel.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 09/01/2025.
//

import SwiftUI

struct CellModel: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var color: Color
}

extension CellModel {
    static let sampleData: [CellModel] = [
        CellModel(title: "Blue", description: "The color of the sky", color: .blue),
        CellModel(title: "Cyan", description: "A beautiful blue", color: .cyan),
        CellModel(title: "Green", description: "Nature has a lot of green", color: .green),
        CellModel(title: "Red", description: "The super hero color", color: .red),
        CellModel(title: "Yellow", description: "Many flowers are yellow", color: .yellow),
        CellModel(title: "Orange", description: "The orange color", color: .orange),
        CellModel(title: "Black", description: "The black color", color: .black),
    ]
}
