//
//  HomeVO.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

enum HomeState {
	case `default`
}

extension HomeView {
	class ViewObject: ObservableObject {
		@Published var state: HomeState?
        @Published var isRequesting: Bool?
        @Published var viewModel: HomeViewModel?

        init(
            state: HomeState? = nil,
            isRequesting: Bool? = nil,
            viewModel: HomeViewModel? = nil
        ) {
			self.state = state
            self.isRequesting = isRequesting
            self.viewModel = viewModel
		}
	}
}
