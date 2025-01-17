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
            if let width: CGFloat = navBarItemWidth, width > 0, width <= settings.width,
               let x: CGFloat = -settings.contentOffset / CGFloat(dataStore.itemsCount) + width / 2{
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
