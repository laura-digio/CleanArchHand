//
//  HomeView.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

/// Known issues:
/// (1) stackoverflow.com/questions/65316497/swiftui-navigationview-navigationbartitle-layoutconstraints-issue

import SwiftUI

struct HomeView: BaseView {
	var output: HomeViewOutput?
	@StateObject var viewObject: ViewObject
    @EnvironmentObject var appEnvironment: AppEnvironment

	var body: some View {
        NavigationView {
            switch viewObject.state {
            case .none, .`default`:
                HomeViewBody(
                    model: viewObject.viewModel,
                    isRequesting: viewObject.isRequesting
                ) { link in
                    output?.detailModule(appEnvironment: appEnvironment, link: link)
                }
                .navigationTitle("moduleHomeTitle")
                .introspectNavigationController { navigationController in
                    appEnvironment.navigationControllers[.home] = navigationController
                }
                .task {
                    output?.onRetrieve(viewObject: viewObject)
                }
                .onReceive(NotificationCenter.default.publisher(
                    for: Notification.Name.monitorConnection
                ).dropFirst()) { _ in
                    output?.onRetrieve(viewObject: viewObject)
                }
            }
        }
        .navigationViewStyle(.stack) // fix for iOS know issue (1)
	}
}

struct HomeViewBody: View {
    let model: HomeViewModel?
    let isRequesting: Bool?
    let onTap: ((String?)->Void)?

    var body: some View {
        if let topics = model?.topics {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(topics, id: \.self) { topic in
                        MainCellView(label: topic.title) {
                            onTap?(topic.link)
                        }
                    }
                }
            }
            .padding(.vertical, 20)
        }
        else {
            VStack {
                Text("...")
            }
            .redacted(reason: isRequesting ?? true ? .placeholder : [])
        }
    }
}

#if DEBUG
struct HomeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBody(model: HomeViewModel(topics: []), isRequesting: true, onTap: nil)
    }
}
#endif
