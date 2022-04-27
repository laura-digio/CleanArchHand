//
//  HomeInteractor.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

class HomeInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: HomeParams?

    let onRetrieveUseCase: HomeOnRetrieveUseCase

    init(
        useCaseExecutor: BaseUseCaseExecutor,
        params: HomeParams?,
        onRetrieveUseCase: HomeOnRetrieveUseCase
    ) {
        self.useCaseExecutor = useCaseExecutor
        self.params = params

        self.onRetrieveUseCase = onRetrieveUseCase
    }
}

extension HomeInteractor: HomeInteractorInput {
    func onRetrieve(completion: @escaping Handler<BusinessObject>) {
        useCaseExecutor.execute(onRetrieveUseCase, completion: completion)
    }
}
