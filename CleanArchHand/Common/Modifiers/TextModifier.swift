//
//  TextModifier.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

struct TextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
            .foregroundColor(Color(Assets.Colors.text.rawValue))
            .font(.custom(Assets.Fonts.interSemiBold.rawValue, size: 14))
	}
}
