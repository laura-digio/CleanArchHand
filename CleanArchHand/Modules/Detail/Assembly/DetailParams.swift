//
//  DetailParams.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

struct DetailParams {
	let initialState: DetailState?
    let link: String?

    init(
        initialState: DetailState? = nil,
        link: String? = nil
    ) {
        self.initialState = initialState
        self.link = link
    }
}
