//
//  ApplicationData.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 09/01/2025.
//

import Foundation

@Observable class ApplicationData {
    
    var cells: [CellModel]

    init(cells: [CellModel]) {
        self.cells = cells
    }
}
