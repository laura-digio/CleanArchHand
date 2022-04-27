//
//  DetailMapper.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class DetailMapper: BaseMapper<DetailInteractor.BusinessObject, DetailView.ViewObject> {
	init() {
		super.init { input -> DetailView.ViewObject in
			return DetailView.ViewObject(
                state: input.viewState,
                isRequesting: input.isRequesting,
                viewModel: DetailViewModel.mapFromAPI(input.markdown)
            )
		}
	}
}
