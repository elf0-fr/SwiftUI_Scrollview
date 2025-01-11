//
//  InitAxis.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 09/01/2025.
//

import SwiftUI

struct InitAxis: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var isHorizontal: Bool = false
    
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Horizontal or Vertical: \(isHorizontal ? "Horizontal" : "Vertical") ", isOn: $isHorizontal)
            }
            
            ScrollView(isHorizontal ? .horizontal : .vertical) {
                content
            }
        }
    }
    
    /// Always start with a standard stack view and only switch to a lazy stack if profiling your code shows a worthwhile performance improvement.
    /// See: https://developer.apple.com/documentation/swiftui/creating-performant-scrollable-stacks
    @ViewBuilder
    var content: some View {
        if isHorizontal {
            HStack {
                ForEach(data.cells) { cell in
                    CellHorizontal(cell: cell)
                    Divider()
                }
            }
        } else {
            VStack {
                ForEach(data.cells) { cell in
                    CellVertical(cell: cell)
                    Divider()
                }
            }
        }
    }
}

#Preview {
    InitAxis()
}
