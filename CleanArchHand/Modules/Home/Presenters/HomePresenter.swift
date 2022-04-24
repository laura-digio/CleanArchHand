//
//  HomePresenter.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright Söderberg & Partners© 2021. All rights reserved.
//

import SwiftUI

class HomePresenter: BasePresenter {
    var wireframeInput: HomeWireframeInput?

    private let interactor: HomeInteractor

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
}

extension HomePresenter: HomeViewOutput {
    func onRetrieve(viewObject: HomeView.ViewObject?) {
        interactor.onRetrieve { result in
            switch result {
            case .success(let businessObject):
                let mappedVO = try? HomeMapper().map(input: businessObject)
                viewObject?.state =? mappedVO?.state
                viewObject?.isRequesting =? mappedVO?.isRequesting
                viewObject?.viewModel =? mappedVO?.viewModel

            case .failure:
                viewObject?.isRequesting = false
            }
        }
    }
}
