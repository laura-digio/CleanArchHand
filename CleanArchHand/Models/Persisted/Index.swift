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

    @Persisted var cleanCode: IndexItem?
    @Persisted var references: IndexItem?
    @Persisted var appleHIG: IndexItem?

    private enum CodingKeys: String, CodingKey {
        case cleanCode
        case references
        case appleHIG
    }

    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cleanCode = try container.decodeIfPresent(IndexItem.self, forKey: .cleanCode) ?? nil
        self.references = try container.decodeIfPresent(IndexItem.self, forKey: .references) ?? nil
        self.appleHIG = try container.decodeIfPresent(IndexItem.self, forKey: .appleHIG) ?? nil
    }
}

public class IndexItem: EmbeddedObject, Codable {
    @Persisted var name: String?
    @Persisted var topics: List<Topic>

    private enum CodingKeys: String, CodingKey {
        case name
        case topics
    }

    override init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String?.self, forKey: .name) ?? nil
        self.topics = try container.decodeIfPresent(List<Topic>.self, forKey: .topics) ?? List<Topic>()
    }
}
