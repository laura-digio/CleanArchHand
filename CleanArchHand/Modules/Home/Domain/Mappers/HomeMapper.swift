//
//  HomeMapper.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class HomeMapper: BaseMapper<HomeInteractor.BusinessObject, HomeView.ViewObject> {
	init() {
		super.init { input -> HomeView.ViewObject in
			return HomeView.ViewObject(
                state: input.viewState,
                isRequesting: input.isRequesting,
                viewModel: HomeViewModel.mapFromAPI(input.indexModel)
            )
		}
	}
}
