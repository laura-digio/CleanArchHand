//
//  Page.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/4/22.
//

import Foundation
import RealmSwift

public class Page: EmbeddedObject, Codable {
    @Persisted var link: String?
    @Persisted var contents: String?

    private enum CodingKeys: String, CodingKey {
        case link
        case contents
    }

    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.link = try container.decodeIfPresent(String?.self, forKey: .link) ?? nil
        self.contents = try container.decodeIfPresent(String?.self, forKey: .contents) ?? nil
    }
}
