//
//  CompactScrollView.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 01..
//

import SwiftUI

public struct CompactScrollView<Content: View> {
    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let content: () -> Content
    @State private var contentSize: CGSize = .zero

    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content
    }
}

extension CompactScrollView: View {
    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            content()
                .readSize {
                    contentSize = $0
                }
        }
        .frame(maxWidth: contentSize.width, maxHeight: contentSize.height)
        .readSize {
            UIScrollView.appearance().bounces = $0.height < contentSize.height
        }
    }
}
