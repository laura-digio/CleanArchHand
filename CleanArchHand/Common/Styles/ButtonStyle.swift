//
//  ButtonStyle.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

struct ButtonStyle: PrimitiveButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		Button(action: configuration.trigger) {
			configuration.label
                .modifier(TextModifier())
		}
		.padding()
	}
}
