//
//  DetailAssembly.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class DetailAssembly: BaseAssembly<
DetailParams,
DetailInteractor,
DetailPresenter,
DetailView
> {
    private var params: DetailParams

    override func resolve() -> DetailView {
		let initialViewObject = DetailView.ViewObject(
			state: params.initialState,
            viewModel: DetailViewModel(link: params.link)
		)
		return DetailView(viewObject: initialViewObject)
    }

    override func resolve() -> DetailPresenter {
        DetailPresenter(interactor: resolve())
    }

	override func resolve() -> DetailInteractor {
		DetailInteractor(
			useCaseExecutor: resolve(),
			params: params,
            onRetrieveUseCase: DetailOnRetrieveUseCase(repository: Repository.shared)
		)
	}

    init(params: DetailParams) {
        self.params = params
        super.init()
    }
}
