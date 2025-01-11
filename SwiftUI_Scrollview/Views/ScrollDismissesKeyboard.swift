//
//  ScrollDismissesKeyboard.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 10/01/2025.
//

import SwiftUI

struct ScrollDismissesKeyboard: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var dismissImmediately = true
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Dismiss mode: \(dismissImmediately ? "immediately" : "interactively")", isOn: $dismissImmediately)
                TextField("Search", text: $text)
            }
            
            ScrollView {
                VStack {
                    ForEach(data.cells) { cell in
                        CellVertical(cell: cell)
                        Divider()
                    }
                }
            }
            .scrollDismissesKeyboard(dismissImmediately ? .immediately : .interactively)
        }
    }
}

#Preview {
    ScrollDismissesKeyboard()
}
