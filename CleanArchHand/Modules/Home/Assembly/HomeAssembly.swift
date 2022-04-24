//
//  HomeAssembly.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class HomeAssembly: BaseAssembly<
HomeParams,
HomeInteractor,
HomePresenter,
HomeView
> {
    private var params: HomeParams

    override func resolve() -> HomeView {
		let initialViewObject = HomeView.ViewObject(
			state: params.initialState
		)
		return HomeView(viewObject: initialViewObject)
    }

    override func resolve() -> HomePresenter {
        HomePresenter(interactor: resolve())
    }

	override func resolve() -> HomeInteractor {
		HomeInteractor(
			useCaseExecutor: resolve(),
			params: params,
            onRetrieveUseCase: HomeOnRetrieveUseCase(repository: Repository.shared)
		)
	}

    init(params: HomeParams) {
        self.params = params
        super.init()
    }
}
