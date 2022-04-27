//
//  Repository.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

/*
    * Repository pattern:
    * Abstracting the access to the data layer in a way that the business layer
    * (use cases) can ignore the sources from where the data is coming.
    * - Sources: DB / File / Web service
    * We'll have at most one repository for each entity in the domain.
*/

import Foundation
import RealmSwift

public class Repository {
    static let shared = Repository() // SINGLETON (must be a CLASS)

    var networkClient = NetworkClient()
    var databaseClient = DatabaseClient()
}

extension Repository {
    func reset() {
        do {
            try databaseClient.realm?.write {
                databaseClient.realm?.deleteAll()
            }
        } catch {
            #if DEBUG
            debugPrint(error)
            #endif
        }
    }
}

// MARK: - Generic persistence method

extension Repository {
    func persistInDataBase<T: Object>(
        modelType: T.Type,
        model: T?,
        identifier: [String: Any]? = nil,
        callback: @escaping (Error?) -> Void
    ) {
        if let model = model {
            do {
                if let token = databaseClient.notificationToken {
                    try databaseClient.realm?.write(withoutNotifying: [token]) {
                        if var allObjects = databaseClient.realm?.objects(modelType.self) {
                            if let identifier = identifier, let firstIdentifier = identifier.first {
                                let predicate = NSPredicate(
                                    format: "%K = %@",
                                    firstIdentifier.key,
                                    firstIdentifier.value as? CVarArg ?? ""
                                )
                                allObjects = allObjects.filter(predicate)
                            }
                            databaseClient.realm?.delete(allObjects)
                        }
                    }
                    try databaseClient.realm?.write {
                        if let identifier = identifier, let firstIdentifier = identifier.first {
                            model.setValue(firstIdentifier.value, forKeyPath: firstIdentifier.key)
                        }
                        databaseClient.realm?.add(model, update: .all)
                    }
                } else {
                    callback(NSError.generic)
                }
            } catch {
                callback(error)
            }
        } else {
            callback(NSError.generic)
        }
    }
}
