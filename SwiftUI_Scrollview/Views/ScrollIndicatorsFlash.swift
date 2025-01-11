//
//  ScrollIndicatorsFlash.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct ScrollIndicatorsFlash: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var shouldFlash = false
    
    var body: some View {
        VStack {
            GroupBox {
                Button("Flash!") {
                    shouldFlash.toggle()
                }
            }
            
            ScrollView {
                VStack {
                    ForEach(data.cells) { cell in
                        CellVertical(cell: cell)
                        Divider()
                    }
                }
            }
            .scrollIndicatorsFlash(trigger: shouldFlash)
        }
    }
}

#Preview {
    ScrollIndicatorsFlash()
}
