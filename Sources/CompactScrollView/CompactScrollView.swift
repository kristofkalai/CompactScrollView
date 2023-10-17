//
//  CompactScrollView.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 01..
//

import SizePreferenceKey
import SwiftUI

public struct CompactScrollView<Content: View> {
    public enum Bounciness {
        case alwaysBounces
        case neverBounces
        case adaptive
    }

    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let bounciness: Bounciness
    private let content: () -> Content
    @State private var contentSize: CGSize?
    @State private var scrollSize: CGSize?

    private var width: CGFloat? {
        if let contentSize, let scrollSize {
            min(scrollSize.width, contentSize.width)
        } else {
            nil
        }
    }

    private var height: CGFloat? {
        if let contentSize, let scrollSize {
            min(scrollSize.height, contentSize.height)
        } else {
            nil
        }
    }

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        bounciness: Bounciness = .adaptive,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.bounciness = bounciness
        self.content = content
    }
}

extension CompactScrollView: View {
    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            content()
                .storeSize(in: $contentSize, block: setBounciness)
        }
        .frame(width: axes.contains(.vertical) ? nil : width, height: axes.contains(.horizontal) ? nil : height)
        .storeSize(in: $scrollSize, block: setBounciness)
    }
}

extension CompactScrollView {
    private func setBounciness() {
        let bounces: Bool? = switch bounciness {
        case .alwaysBounces: true
        case .neverBounces: false
        case .adaptive:
            if let contentSize, let scrollSize {
                scrollSize.height < contentSize.height
            } else {
                nil
            }
        }
        if let bounces {
            UIScrollView.appearance().bounces = bounces
        }
    }
}
