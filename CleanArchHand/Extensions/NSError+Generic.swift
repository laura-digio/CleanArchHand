//
//  NSError+Generic.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import Foundation

extension NSError {
    static var generic: Self {
        return Self(
			domain: "GenericError",
			code: -101,
			userInfo: [NSLocalizedDescriptionKey: "errorGenericTitle".localized()]
		)
    }

    static func custom(reason: String? = nil, description: String? = nil) -> Self {
        var userInfo: [String: Any] = [:]
        if let reason = reason {
            userInfo[NSLocalizedFailureReasonErrorKey] = NSLocalizedString(
                "",
                value: reason,
                comment: ""
            )
        }
        if let description = description {
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(
                "",
                value: description,
                comment: ""
            )
        }
        return Self(
            domain: "CustomError",
            code: -102,
            userInfo: userInfo
        )
    }
}
