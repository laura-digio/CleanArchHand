//
//  BottomMenuModifier.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 23/4/22.
//

import SwiftUI

struct BottomMenuModifier: ViewModifier {
    let title: String
    let image: Image
    let tag: AppConstants.BottomMenuSelection

    init(title: String, image: Assets.Images, tag: AppConstants.BottomMenuSelection) {
        self.title = title
        self.image = Image(image.rawValue)
        self.tag = tag
    }

    init(title: String, image: Image, tag: AppConstants.BottomMenuSelection) {
        self.title = title
        self.image = image
        self.tag = tag
    }

    @EnvironmentObject var appEnvironment: AppEnvironment

    func body(content: Content) -> some View {
        content
            .tabItem {
                image.renderingMode(.template)
                Text(title)
                    .font(.custom(Assets.Fonts.interMedium.rawValue, size: 10))
            }
            .tag(tag)
            .navigationTitle(title)
    }
}
