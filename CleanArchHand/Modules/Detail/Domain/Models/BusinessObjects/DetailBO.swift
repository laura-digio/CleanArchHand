//
//  DetailBO.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

extension DetailInteractor {
    struct BusinessObject {
		let viewState: DetailState?
        let isRequesting: Bool?
        let markdown: String?

        init(
            viewState: DetailState? = nil,
            isRequesting: Bool? = nil,
            markdown: String? = nil
        ) {
            self.viewState = viewState
            self.isRequesting = isRequesting
            self.markdown = markdown
        }
    }
}
