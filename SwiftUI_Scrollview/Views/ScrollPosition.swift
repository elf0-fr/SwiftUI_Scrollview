//
//  ScrollPosition.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 09/01/2025.
//
// scrollTargetLayout is mandatory.
//

import SwiftUI

struct ScrollPositionWithId: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var cellID: CellModel.ID? = nil
    
    var currentCellTitle: String {
        var title = "Unkown"

        if let cell = data.cells.first(where: { $0.id == cellID }) {
            title = cell.title
        }

        return title
    }
    
    var body: some View {
        VStack {
            Text("Current position is \(currentCellTitle)")
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(data.cells) { cell in
                        CellHorizontal(cell: cell, withFrame: true)
                    }
                    Button("< Back") {
                        cellID = data.cells.first?.id
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollPosition(id: $cellID)
        }
    }
}

struct ScrollPositionWithScrollPositionIndex: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var position = ScrollPosition(id: 0)
    
    var currentCellTitle: String {
        var title = "Unkown"

        if let viewID = position.viewID as? Int {
            title = data.cells[viewID].title
        } else if let edge = position.edge {
            title = "\(edge)"
        }

        return title
    }
    
    var body: some View {
        VStack {
            Text("The current cell is \(currentCellTitle)")
            
            HStack {
                Button("Leading") {
                    position.scrollTo(edge: .leading)
                }
                
                Button("Trailing") {
                    position.scrollTo(edge: .trailing)
                }
                
                Button("Random") {
                    position.scrollTo(id: Int.random(in: 0..<data.cells.count))
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    let count = data.cells.count
                    ForEach(0..<count, id: \.self) {
                        CellHorizontal(cell: data.cells[$0], withFrame: true)
                            .id($0)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollPosition($position)
        }
    }
}

struct ScrollPositionWithScrollPositionType: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var position = ScrollPosition(idType: CellModel.ID.self)
    
    var currentCellTitle: String {
        var title = "Unkown"

        if let viewID = position.viewID(type: CellModel.ID.self),
        let cell = data.cells.first(where: { $0.id == viewID }) {
            title = cell.title
        } else if let edge = position.edge {
            title = "\(edge)"
        }
        
        return title
    }
    
    var body: some View {
        VStack {
            Text("The current cell is \(currentCellTitle)")
            
            HStack {
                Button("Leading") {
                    position.scrollTo(edge: .leading)
                }
                
                Button("Trailing") {
                    position.scrollTo(edge: .trailing)
                }
                
                Button("Random") {
                    let ids = data.cells.map(\.id)
                    position.scrollTo(id: ids.randomElement())
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(data.cells) {
                        CellHorizontal(cell: $0, withFrame: true)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollPosition($position)
        }
    }
}

struct DefaultScrollAnchor: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(data.cells) {
                    CellHorizontal(cell: $0, withFrame: true)
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .defaultScrollAnchor(.center)
    }
}

#Preview("With id") {
    ScrollPositionWithId()
}

#Preview("With index") {
    ScrollPositionWithScrollPositionIndex()
}

#Preview("With type") {
    ScrollPositionWithScrollPositionType()
}

#Preview("Default scroll anchor") {
    DefaultScrollAnchor()
}
