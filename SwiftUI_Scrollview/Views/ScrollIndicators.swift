//
//  ScrollIndicators.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 10/01/2025.
//

import SwiftUI

struct ScrollIndicators: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showIndicators: Bool = false
    
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Show Indicators", isOn: $showIndicators)
            }
            
            ScrollView {
                VStack {
                    ForEach(data.cells) { cell in
                        CellVertical(cell: cell)
                        Divider()
                    }
                }
            }
            .scrollIndicators(showIndicators ? .visible : .hidden)
        }
    }
}

#Preview {
    ScrollIndicators()
}
