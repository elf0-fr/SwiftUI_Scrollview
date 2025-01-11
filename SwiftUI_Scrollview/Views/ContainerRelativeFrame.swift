//
//  ContainerRelativeFrame.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 10/01/2025.
//

import SwiftUI

struct ContainerRelativeFrame: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var numberOfCells = 2
    @State private var span = 1
    
    var body: some View {
        VStack {
            GroupBox {
                Stepper("Number of cells: \(numberOfCells)", value: $numberOfCells, in: 1...4)
                Stepper("Number of cells per page: \(span)", value: $span, in: 1...4)
            }
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(data.cells) { cell in
                        CellHorizontal(cell: cell)
                            .containerRelativeFrame(
                                .horizontal,
                                count: numberOfCells,
                                span: span,
                                spacing: 0
                            )
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContainerRelativeFrame()
}
