//
//  DetailViewModel.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 13/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct DetailViewModel {
    let link: String?

    static func mapFromAPI(_ APIModel: String?) -> DetailViewModel? {
        guard let APIModel = APIModel else {
            return nil
        }

        return DetailViewModel(
            link: APIModel
        )
    }
}
