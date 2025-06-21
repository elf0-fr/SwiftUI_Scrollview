//
//  InfiniteScrolling.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 04/03/2025.
//

import SwiftUI

struct InfiniteScrolling: View {

    var colors = [Color.red, Color.blue, Color.green, Color.yellow]
    
    @Binding var scrollPosition: Int?
    
    private let animationDuration: CGFloat = 0.3
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0...2, id: \.self) { loopIndex in
                    makeContent(loopIndex)
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .onAppear {
            // start at the first item of the second colors array
            scrollPosition = colors.count
        }
        .onChange(of: scrollPosition) {
            updateArrayToPerformInfiniteScrollingTowardLeft()
            updateArrayToPerformInfiniteScrollingTowardRight()
        }
    }
    
    func getId(loopIndex: Int, index: Int) -> Int {
        return index + loopIndex * 4
    }
    
    @ViewBuilder
    func makeContent(_ loopIndex: Int) -> some View {
        let with: CGFloat = 250
        let height: CGFloat = 350
        let widthDiff: CGFloat = UIScreen.main.bounds.width - with
        
        ForEach(colors.indices, id: \.self) { index in
            let color = colors[index]
            let id = getId(loopIndex: loopIndex, index: index)
            
            Text("\(color)\nloop: \(loopIndex)   index: \(index)")
                .frame(width: with, height: height)
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(color)
                }
                .padding(.horizontal, widthDiff / 2)
                .id(id)
        }
    }
    
    private func updateArrayToPerformInfiniteScrollingTowardLeft() {
        guard let scrollPosition else { return }
        
        let itemCount = colors.count
        
        // last item of the first colors Array
        if scrollPosition / itemCount == 0 && scrollPosition % itemCount == itemCount - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                // This code allow an infinite scrolling toward left.
                self.scrollPosition = scrollPosition + colors.count
            }
        }
    }
    
    private func updateArrayToPerformInfiniteScrollingTowardRight() {
        guard let scrollPosition else { return }
        
        let itemCount = colors.count
       
        // first item of the last colors Array
        if scrollPosition / itemCount == 2 && scrollPosition % itemCount == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                self.scrollPosition = scrollPosition - colors.count
            }
        }
    }
}

struct InfiniteScrollingWithDotsIndicator: View {
    
    let colors = [Color.red, Color.blue, Color.green, Color.yellow]
    @State private var scrollPosition: Int?
    
    var body: some View {
        InfiniteScrolling(colors: colors, scrollPosition: $scrollPosition)
            .overlay(alignment: .bottom) {
                HStack {
                    ForEach(colors.indices, id: \.self) { index in
                        Button {
                            withAnimation {
                                scrollPosition = index + colors.count
                            }
                        } label: {
                            Circle()
                                .fill(.thickMaterial.opacity((index == (scrollPosition ?? 0) % colors.count) ? 0.8 : 0.3))
                                .frame(width: 15)
                        }
                    }
                }
                .padding(.bottom)
            }
    }
}

#Preview {
    @Previewable @State var scrollPosition: Int?
    InfiniteScrolling(scrollPosition: $scrollPosition)
}

#Preview {
    InfiniteScrollingWithDotsIndicator()
}
