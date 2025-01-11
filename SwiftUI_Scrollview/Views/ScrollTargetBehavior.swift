//
//  ScrollTargetBehavior.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 09/01/2025.
//

import SwiftUI

/// When using .scrollTargetBehavior(.paging) the spacing of the stack has to be 0.
struct ScrollTargetBehaviorPaging: View {
    
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
            .scrollTargetBehavior(.paging)
        }
    }
}

/// When using .scrollTargetBehavior(.viewAligned) the .scrollTargetLayout() modifier has to be applied to the element of the scrollView.
struct ScrollTargetBehaviorViewAligned: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    let rows = [GridItem(.fixed(150)), GridItem(.fixed(150))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(data.cells) { cell in
                    CellHorizontal(cell: cell)
                        .containerRelativeFrame(
                            .horizontal,
                            count: 2,
                            spacing: 0
                        )
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview("Paging") {
    ScrollTargetBehaviorPaging()
}

#Preview("View Aligned") {
    ScrollTargetBehaviorViewAligned()
}
