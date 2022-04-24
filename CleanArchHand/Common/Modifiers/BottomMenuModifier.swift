//
//  BottomMenuModifier.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 23/4/22.
//

import SwiftUI

struct BottomMenuModifier: ViewModifier {
    let title: String
    let image: Assets.Images
    let tag: AppConstants.BottomMenuSelection

    func body(content: Content) -> some View {
        NavigationView {
            content
                .tabItem {
                    Image(image.rawValue)
                        .renderingMode(.template)
                    Text(title)
                        .font(.custom(Assets.Fonts.interMedium.rawValue, size: 10))
                }
                .tag(tag)
                .navigationTitle(title)
        }
    }
}
