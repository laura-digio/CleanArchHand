//
//  MainSectionView.swift
//  CleanArchHand
//
//  Created by Laura on 14/5/22.
//

import SwiftUI

struct MainSectionView: View {
    let label: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label ?? "")
                .font(.custom(Assets.Fonts.interMedium.rawValue, size: 22))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#if DEBUG
struct MainSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MainSectionView(
            label: "Clean Code"
        )
    }
}
#endif
