//
//  HomeParams.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

struct HomeParams {
	let initialState: HomeState?

    init(
        initialState: HomeState? = nil
    ) {
        self.initialState = initialState
    }
}
