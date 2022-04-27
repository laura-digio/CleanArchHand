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

extension HomeWireframe: HomeWireframeInput {
    func detailModule(appEnvironment: AppEnvironment, link: String?) {
        let params = DetailParams(link: link)
        let view = DetailWireframe(params: params).view
        let controller = UIHostingController(rootView: view)
        appEnvironment.coordinator?.pushViewController(controller, animated: true)
    }
}
