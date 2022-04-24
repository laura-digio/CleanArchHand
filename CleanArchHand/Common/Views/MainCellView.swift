//
//  MainCellView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 1/3/21.
//

import SwiftUI

struct MainCellView<DestinationView: View>: View {
    let label: String?
    @ViewBuilder var destinationView: DestinationView

    var body: some View {
        NavigationLink(destination: destinationView) {
            Text(label ?? "")
        }
        .buttonStyle(ButtonStyle())
    }
}
