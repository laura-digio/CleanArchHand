//
//  DetailPresenter.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright Söderberg & Partners© 2021. All rights reserved.
//

import SwiftUI

class DetailPresenter: BasePresenter {
    var wireframeInput: DetailWireframeInput?

    private let interactor: DetailInteractor

    init(interactor: DetailInteractor) {
        self.interactor = interactor
    }
}

extension DetailPresenter: DetailViewOutput {
    func onRetrieve(_ viewObject: DetailView.ViewObject?) {
        interactor.onRetrieve(link: viewObject?.viewModel?.link) { result in
            switch result {
            case .success(let businessObject):
                let mappedVO = try? DetailMapper().map(input: businessObject)
                viewObject?.state =? mappedVO?.state
                viewObject?.isRequesting =? mappedVO?.isRequesting
                viewObject?.viewModel =? mappedVO?.viewModel

            case .failure:
                viewObject?.isRequesting = false
            }
        }
    }
}
