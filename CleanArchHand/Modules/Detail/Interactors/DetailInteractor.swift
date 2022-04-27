//
//  DetailInteractor.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

class DetailInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: DetailParams?

    let onRetrieveUseCase: DetailOnRetrieveUseCase

    init(
        useCaseExecutor: BaseUseCaseExecutor,
        params: DetailParams?,
        onRetrieveUseCase: DetailOnRetrieveUseCase
    ) {
        self.useCaseExecutor = useCaseExecutor
        self.params = params

        self.onRetrieveUseCase = onRetrieveUseCase
    }
}

extension DetailInteractor: DetailInteractorInput {
    func onRetrieve(link: String?, completion: @escaping Handler<BusinessObject>) {
        useCaseExecutor.execute(onRetrieveUseCase, with: link, completion: completion)
    }
}
