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
    let markdown: String?

    init(link: String? = nil, markdown: String? = nil) {
        self.link = link
        self.markdown = markdown
    }

    static func mapFromAPI(link: String?, markdown: String?) -> DetailViewModel? {
        return DetailViewModel(
            link: link,
            markdown: markdown
        )
    }
}
