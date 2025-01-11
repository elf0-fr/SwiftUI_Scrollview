//
//  ScrollDisabled.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct ScrollDisabled: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var disabled: Bool = false
    
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Disable Scroll", isOn: $disabled)
            }
            
            ScrollView {
                VStack {
                    ForEach(data.cells) { cell in
                        CellVertical(cell: cell)
                        Divider()
                    }
                }
            }
            .scrollDisabled(disabled)
        }
    }
}

#Preview {
    ScrollDisabled()
}
