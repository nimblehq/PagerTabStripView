//
//  IndicatorBarView.swift
//  PagerTabStripView
//
//  Copyright © 2021 Xmartlabs SRL. All rights reserved.
//

import Foundation
import SwiftUI


internal struct IndicatorBarView: View {
    @EnvironmentObject private var dataStore: DataStore

    var body: some View {
        HStack {
            content
        }
        .frame(height: style.indicatorBarHeight)
    }

    var content: some View {
        let totalItemWidth = (settings.width - (style.tabItemSpacing * CGFloat(dataStore.itemsCount - 1)))
        let navBarItemWidth = totalItemWidth / CGFloat(dataStore.itemsCount)
        return Group {
            if let width = navBarItemWidth, width > 0, width <= settings.width {
                let x = -settings.contentOffset / CGFloat(dataStore.itemsCount) + width / 2
                Rectangle()
                    .fill(style.indicatorBarColor)
                    .animation(.default)
                    .frame(width: width)
                    .position(x: x, y: 0)
            } else {
                EmptyView()
            }
        }
    }

    @Environment(\.pagerStyle) var style: PagerStyle
    @EnvironmentObject private var settings: PagerSettings
}
