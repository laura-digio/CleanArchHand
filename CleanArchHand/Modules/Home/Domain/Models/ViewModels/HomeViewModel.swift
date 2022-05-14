//
//  HomeViewModel.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 13/1/22.
//  Copyright © 2022 Söderberg & Partners. All rights reserved.
//

import Foundation

struct HomeViewModel {
    let groups: [ViewGroup]

    static func mapFromAPI(_ APIModel: Index?) -> HomeViewModel? {
        guard let APIModel = APIModel else {
            return nil
        }

        var groups: [ViewGroup] = []
        if let cleanCode = APIModel.cleanCode {
            groups.append(ViewGroup(cleanCode))
        }
        if let references = APIModel.references {
            groups.append(ViewGroup(references))
        }
        if let appleHIG = APIModel.appleHIG {
            groups.append(ViewGroup(appleHIG))
        }

        return HomeViewModel(
            groups: groups
        )
    }
}

struct ViewGroup: Hashable {
    let name: String?
    let topics: [ViewTopic]

    init(_ item: IndexItem) {
        self.name = item.name
        self.topics = (item.topics).compactMap { ViewTopic(title: $0.title, link: $0.link) }
    }
}

struct ViewTopic: Hashable {
    let title: String?
    let link: String?
}
