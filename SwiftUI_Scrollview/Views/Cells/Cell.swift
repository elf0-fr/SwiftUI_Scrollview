//
//  Cell.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct CellHorizontal: View {
    
    let cell: CellModel
    let withFrame: Bool
    
    init(cell: CellModel, withFrame: Bool = false) {
        self.cell = cell
        self.withFrame = withFrame
    }
    
    var body: some View {
        VStack {
            Text(cell.title).bold()
            if withFrame {
                cell.color.frame(width: 80, height: 100)
            } else {
                cell.color
            }
            Text(cell.description).font(.body).lineLimit(1)
        }
        .padding([.top, .bottom], 5)
        .padding([.leading, .trailing], 10)
    }
}

struct CellVertical: View {
    
    let cell: CellModel
    
    var body: some View {
        VStack {
            HStack {
                cell.color
                    .frame(width: 80, height: 100)
                VStack(alignment: .leading) {
                    Text(cell.title).bold()
                    Text(cell.description).font(.caption)
                    Spacer()
                }.padding([.leading])
                Spacer()
            }
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 10)
        }
    }
}
