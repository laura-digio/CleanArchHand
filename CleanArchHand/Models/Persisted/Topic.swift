//
//  Topic.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/4/22.
//

import Foundation
import RealmSwift

public class Topic: EmbeddedObject, Codable {
    @Persisted var id: String?
    @Persisted var title: String?
    @Persisted var link: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case link
    }

    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String?.self, forKey: .id) ?? nil
        self.title = try container.decodeIfPresent(String?.self, forKey: .title) ?? nil
        self.link = try container.decodeIfPresent(String?.self, forKey: .link) ?? nil
    }
}
