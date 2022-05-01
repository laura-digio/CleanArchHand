//
//  DetailOnRetrieveUseCase.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct DetailOnRetrieveUseCase: BaseUseCase {
	internal let repository: Repository

	typealias Params = String?
	typealias Response = DetailInteractor.BusinessObject

	init(repository: Repository) {
		self.repository = repository
	}

    func execute(with params: String?, completion: @escaping Handler<Response>) {
        let businessObject = Response(isRequesting: true)
        completion(.success(businessObject))

        repository.networkClient.requestMarkdown(params) { response in
            let bo = Response(
                isRequesting: false,
                link: params,
                markdown: response.value
            )
            completion(.success(bo))
        }
    }
}
