//
//  ScrollBounceBehavior.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct ScrollBounceBehaviorBasedOnSize: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var numberOfCells = 2
    
    var body: some View {
        VStack {
            GroupBox {
                Stepper("Number of cells: \(numberOfCells)", value: $numberOfCells, in: 1...4)
            }
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<numberOfCells, id: \.self) {
                        CellHorizontal(cell: data.cells[$0])
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
        }
    }
}

#Preview("Based on Size") {
    ScrollBounceBehaviorBasedOnSize()
}
