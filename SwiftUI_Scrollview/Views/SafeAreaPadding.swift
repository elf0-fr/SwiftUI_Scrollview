//
//  SafeAreaPadding.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 10/01/2025.
//

import SwiftUI

struct SafeAreaPadding: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    let size: CGFloat = 300
    let spacing: CGFloat = 5
    private func safeAreaPadding(totalWidth width: CGFloat) -> CGFloat {
        return (width - (size + spacing)) / 2
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach(data.cells) { cell in
                        CellHorizontal(cell: cell)
                            .frame(width: size, height: size)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, safeAreaPadding(totalWidth: proxy.size.width))
        }
    }
}

#Preview {
    SafeAreaPadding()
}
