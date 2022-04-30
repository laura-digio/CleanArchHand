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
        VStack(alignment: .leading, spacing: 0) {
            Label {
                Button {
                    action?()
                } label: {
                    Text(label ?? "")
                }.buttonStyle(ButtonStyle())
            } icon: {
                Image(systemName: "book")
            }
            .padding()

            Divider()
                .modifier(DividerModifier())
        }
    }
}

#if DEBUG
struct MainCellView_Previews: PreviewProvider {
    static var previews: some View {
        MainCellView(
            label: "Separation of Concerns",
            action: nil
        )
    }
}
#endif
