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
            DetailViewBody(model: viewObject.viewModel)
            .task {
                output?.onRetrieve(viewObject)
            }
        }
	}
}

struct DetailViewBody: View {
    let model: DetailViewModel?

    var body: some View {
        Text(model?.link ?? "")
    }
}

#if DEBUG
struct DetailViewBody_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewBody(model: DetailViewModel(link: nil))
    }
}
#endif
