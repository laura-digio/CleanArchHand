//
//  HomeOnRetrieveUseCase.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct HomeOnRetrieveUseCase: BaseUseCase {
	internal let repository: Repository

	typealias Params = Void
	typealias Response = HomeInteractor.BusinessObject

	init(repository: Repository) {
		self.repository = repository
	}

	func execute(completion: @escaping Handler<Response>) {
        let indexModel = repository.fetchIndex()
        let businessObject = Response(isRequesting: true, indexModel: indexModel)
        completion(.success(businessObject))

        repository.requestIndex { error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let indexModel = repository.fetchIndex()
            let businessObject = Response(isRequesting: false, indexModel: indexModel)
            completion(.success(businessObject))
        }
    }
}
