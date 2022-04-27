//
//  HomeViewModel.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 13/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct HomeViewModel {
    let topics: [ViewTopic]?

    struct ViewTopic: Hashable {
        let title: String?
        let link: String?
    }

    static func mapFromAPI(_ APIModel: Index?) -> HomeViewModel? {
        guard let APIModel = APIModel else {
            return nil
        }

        return HomeViewModel(
            topics: APIModel.topics.compactMap { ViewTopic(title: $0.title, link: $0.link) }
        )
    }
}
