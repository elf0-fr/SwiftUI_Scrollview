//
//  InfiniteScrolling.swift
//  SwiftUI_Scrollview
//
//  Created by Elfo on 04/03/2025.
//

import SwiftUI

struct InfiniteScrolling: View {
    
    @State private var scrollPosition: Int?
    @State private var itemsArray: [[Color]] = []
    
    private let colors = [Color.red, Color.blue, Color.green, Color.yellow]
    private let with: CGFloat = 250
    private let height: CGFloat = 350
    private let animationDuration: CGFloat = 0.3
    
    var body: some View {
        let itemsTemp = itemsArray.flatMap { $0 }
        let widthDiff = UIScreen.main.bounds.width - with
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(itemsTemp.indices, id: \.self) { index in
                    let color = itemsTemp[index]
                    Text("\(color)")
                        .frame(width: with, height: height)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(color)
                        }
                        .padding(.horizontal, widthDiff / 2)
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .onAppear {
            itemsArray = [colors, colors, colors]
            
            // start at the first item of the second colors array
            scrollPosition = colors.count
        }
        .onChange(of: scrollPosition) {
            guard let scrollPosition else { return }
            
            let itemCount = colors.count
            // last item of the first colors Array
            if scrollPosition / itemCount == 0 && scrollPosition % itemCount == itemCount - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    // append colors array before the first and remove the current last color array.
                    // This code allow an infinite scrolling toward left.
                    itemsArray.removeLast()
                    itemsArray.insert(colors, at: 0)
                    self.scrollPosition = scrollPosition + colors.count
                }
            }
            
            // first item of the last colors Array
            if scrollPosition / itemCount == 2 && scrollPosition % itemCount == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    itemsArray.removeFirst()
                    itemsArray.append(colors)
                    self.scrollPosition = scrollPosition - colors.count
                }
            }
        }
    }
}

#Preview {
    InfiniteScrolling()
}
