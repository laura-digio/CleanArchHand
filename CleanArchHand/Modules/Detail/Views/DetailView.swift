//
//  DetailView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

struct DetailView: BaseView {
	var output: DetailViewOutput?
	@StateObject var viewObject: ViewObject

	var body: some View {
        switch viewObject.state {
        case .none, .`default`:
            DetailViewBody(model: viewObject.viewModel, isRequesting: viewObject.isRequesting)
            .task {
                output?.onRetrieve(viewObject)
            }
        }
	}
}

struct DetailViewBody: View {
    let model: DetailViewModel?
    let isRequesting: Bool?

    @State private var isRotating = false
    var yAxis: CGFloat = 1.0

    var body: some View {
        if isRequesting ?? false {
            Image(systemName: "network")
                .font(.system(size: 60, weight: .thin))
                    .rotation3DEffect(
                        .degrees(isRotating ? 45 : -45),
                        axis: (x: 0, y: yAxis, z: 0)
                    )
                    .animation(
                        .easeInOut(duration: 0.75).repeatForever(autoreverses: true),
                        value: isRotating
                    )
                    .onAppear {
                        isRotating.toggle()
                    }
        }
        else {
            Text(model?.link ?? "")
            Text(model?.markdown ?? "")
        }
    }
}

#if DEBUG
struct DetailViewBody_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewBody(model: DetailViewModel(link: ""), isRequesting: true)
    }
}
#endif
