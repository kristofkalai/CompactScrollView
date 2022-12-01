//
//  SizePreferenceKey.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 01..
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { }
}
