//
//  User.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

// Entity User

import Foundation

struct User: Codable {
    let email: String?

    init(email: String?) {
        self.email = email
    }
}
