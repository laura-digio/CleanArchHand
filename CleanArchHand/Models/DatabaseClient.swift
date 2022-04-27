//
//  DatabaseClient.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import Foundation
import RealmSwift

struct DatabaseClient {
    var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            #if DEBUG
            debugPrint(error)
            #endif
            return nil
        }
    }

	var notificationToken: NotificationToken?

    init() {
        setupRealm(databaseName: "db")
    }

    private func setupRealm(databaseName: String) {
        var config = Realm.Configuration(schemaVersion: 1, migrationBlock: migrateIfNeeded)
		if let fileURL = config.fileURL {
			config.fileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(databaseName).realm")
			Realm.Configuration.defaultConfiguration = config
		}
    }

    private func migrateIfNeeded(migration: Migration, oldSchemaVersion: UInt64) {}
}
