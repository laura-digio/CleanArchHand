//
//  HomeWireframe.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

final class HomeWireframe: BaseWireframe<
HomeParams,
HomeInteractor,
HomePresenter,
HomeView
> {
    init(params: HomeParams) {
        super.init(assembly: HomeAssembly(params: params))
    }
}

extension HomeWireframe: HomeWireframeInput {}
