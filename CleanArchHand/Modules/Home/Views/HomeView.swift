//
//  HomeView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

struct HomeView: BaseView {
	var output: HomeViewOutput?
	@StateObject var viewObject: ViewObject
    @EnvironmentObject var appEnvironment: AppEnvironment

	var body: some View {
        switch viewObject.state {
        case .none, .`default`:
            HomeViewBody(
                model: viewObject.viewModel,
                isRequesting: viewObject.isRequesting
            ) { link in
                output?.detailModule(appEnvironment: appEnvironment, link: link)
            }
            .task {
                output?.onRetrieve(viewObject: viewObject)
            }
        }
	}
}

struct HomeViewBody: View {
    let model: HomeViewModel?
    let isRequesting: Bool?
    let onTap: ((String?)->Void)?

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                if let topics = model?.topics {
                    ForEach(topics, id: \.self) { topic in
                        MainCellView(label: topic.title) {
                            onTap?(topic.link)
                        }
                    }
                }
                else {
                    Text("...")
                        .redacted(reason: isRequesting ?? true ? .placeholder : [])
                }
            }
        }
        .padding(.vertical, 20)
    }
}

#if DEBUG
struct HomeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBody(model: HomeViewModel(topics: []), isRequesting: true, onTap: nil)
    }
}
#endif
