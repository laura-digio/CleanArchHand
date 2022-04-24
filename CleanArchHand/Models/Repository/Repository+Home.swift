//
//  Repository+Home.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

// Repository for entities used in module Home

import Foundation
import RealmSwift

// MARK: - Local

extension Repository {
	func fetchIndex() -> Index? {
		let results = databaseClient.realm?.objects(Index.self)
		return results?.first?.freeze()
	}
}

// MARK: - Remote Web Service

extension Repository {
	func requestIndex(callback: @escaping (Error?) -> Void) {
        networkClient.endpoint(method: .get, endpoint: .index) { response in
            if let error = response.error {
				callback(error)
			} else {
                switch response.result {
                case .success(let model):
                    // Persist in database
                    self.databaseClient.notificationToken = self.databaseClient.realm?.observe { _, _ in
                        callback(nil)
                    }
                    self.persistInDataBase(
                        modelType: Index.self,
                        model: model,
                        callback: callback
                    )
                    self.databaseClient.notificationToken?.invalidate()
                case .failure(let error):
                    callback(error)
                }
			}
		}
	}
}
