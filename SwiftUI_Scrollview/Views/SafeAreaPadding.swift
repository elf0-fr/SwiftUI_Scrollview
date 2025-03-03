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

struct SafeAreaPadding2: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    let size: CGFloat = 300
    let spacing: CGFloat = 5
    private func safeAreaPadding() -> CGFloat {
        return (UIScreen.main.bounds.width - (size + spacing)) / 2
    }
    
    var body: some View {
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
            .safeAreaPadding(.horizontal, safeAreaPadding())
    }
}

struct WithoutSafeAreaPadding: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    @State var scrollPosition: Int? = 0
    let size: CGFloat = 300
    let offsetPercentage: CGFloat = 0.85
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(data.cells.indices, id: \.self) { index in
                    let cell = data.cells[index]
                    let widthDifference = UIScreen.main.bounds.width - size
                    CellHorizontal(cell: cell)
                        .frame(width: size, height: size)
                        .padding(.horizontal, widthDifference/2)
                        .offset(x: (index == scrollPosition)
                                ? 0
                                : (index < scrollPosition ?? data.cells.count)
                                ? widthDifference * offsetPercentage
                                : -widthDifference * offsetPercentage)
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
    }
}

#Preview("Safe area padding") {
    SafeAreaPadding()
}

#Preview("Safe area padding2") {
    SafeAreaPadding2()
}

#Preview("Without safe area padding") {
    WithoutSafeAreaPadding()
}
