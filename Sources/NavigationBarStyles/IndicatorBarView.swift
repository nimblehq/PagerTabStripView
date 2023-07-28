//
//  IndicatorBarView.swift
//  PagerTabStripView
//
//  Created by Cecilia Pirotto on 11/8/21.
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
        let totalItemWidth: CGFloat = (settings.width - (style.tabItemSpacing * CGFloat(dataStore.itemsCount - 1)))
        let navBarItemWidth: CGFloat = totalItemWidth / CGFloat(dataStore.itemsCount)
        return Group {
            let x: CGFloat = -settings.contentOffset / CGFloat(dataStore.itemsCount) + navBarItemWidth / 2
            if navBarItemWidth > 0, navBarItemWidth <= settings.width {
                Rectangle()
                    .fill(style.indicatorBarColor)
                    .animation(.default)
                    .frame(width: navBarItemWidth)
                    .position(x: x, y: 0)
            } else {
                EmptyView()
            }
        }
    }

    @Environment(\.pagerStyle) var style: PagerStyle
    @EnvironmentObject private var settings: PagerSettings
}
