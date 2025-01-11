//
//  ScrollClipDisabled.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct ScrollClipDisabled: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var zIndex = 0.0
    
    var body: some View {
        VStack {
            GroupBox {
                Stepper("zIndex of top Text: \(zIndex.formatted(.number))", value: $zIndex, in: 0...1)
            }
            // UPdate zIndex to override scrollClipDisabled
            .zIndex(1)
            
            Text("Fixed at the top")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(.green)
                    .foregroundStyle(.white)
                    .zIndex(zIndex)
            
            ScrollView(.vertical) {
                VStack() {
                    ForEach(data.cells) {
                        CellVertical(cell: $0)
                        Divider()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
            
            Text("Fixed at the top")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(.green)
                    .foregroundStyle(.white)
        }
    }
}

#Preview {
    ScrollClipDisabled()
}
