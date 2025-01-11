//
//  ScrollTransition.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 11/01/2025.
//

import SwiftUI

struct ScrollTransition: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(data.cells) { cell in
                        CellHorizontal(cell: cell)
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition(axis: .horizontal) { effect, phase in
                                effect
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0)
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
        }
    }
}

struct ScrollTransitionWithAnimatedThreshold: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(data.cells) { cell in
                        CellHorizontal(cell: cell)
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition(.animated.threshold(.visible(0.2)), axis: .horizontal) { effect, phase in
                                effect
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ScrollTransition()
}

#Preview("With Animated Threshold") {
    ScrollTransitionWithAnimatedThreshold()
}
