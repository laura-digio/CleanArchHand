//
//  Index.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/4/22.
//

import Foundation
import RealmSwift

public class Index: Object, Codable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var topics: List<Topic>

    private enum CodingKeys: String, CodingKey {
        case topics
    }

    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.topics = try container.decodeIfPresent(List<Topic>.self, forKey: .topics) ?? List<Topic>()
    }
}
