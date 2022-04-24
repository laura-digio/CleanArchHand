//
//  DetailWireframe.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import SwiftUI

final class DetailWireframe: BaseWireframe<
DetailParams,
DetailInteractor,
DetailPresenter,
DetailView
> {
    init(params: DetailParams) {
        super.init(assembly: DetailAssembly(params: params))
    }
}

extension DetailWireframe: DetailWireframeInput {}
