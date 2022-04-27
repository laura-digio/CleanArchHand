//
//  DetailVO.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

enum DetailState {
	case `default`
}

extension DetailView {
	class ViewObject: ObservableObject {
		@Published var state: DetailState?
        @Published var isRequesting: Bool?
        @Published var viewModel: DetailViewModel?

        init(
            state: DetailState? = nil,
            isRequesting: Bool? = nil,
            viewModel: DetailViewModel? = nil
        ) {
			self.state = state
            self.isRequesting = isRequesting
            self.viewModel = viewModel
		}
	}
}
