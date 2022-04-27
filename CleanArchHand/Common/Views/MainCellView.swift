//
//  MainCellView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 1/3/21.
//

import SwiftUI

struct MainCellView: View {
    let label: String?
    let action: (()->Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            Text(label ?? "")
        }
        .buttonStyle(ButtonStyle())
    }
}
