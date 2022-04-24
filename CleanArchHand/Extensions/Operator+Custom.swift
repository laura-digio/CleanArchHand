//
//  Operator+Custom.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import Foundation

precedencegroup ConditionalAssignmentPrecedence {
    associativity: left
    assignment: true
    higherThan: AssignmentPrecedence
}

infix operator =?: ConditionalAssignmentPrecedence

/// Set value of left-hand side only if right-hand side differs from `nil`
public func =?<T> (variable: inout T, value: T?) {
    if let val = value {
        variable = val
    }
}

/// Set value of left-hand side only if right-hand side differs from `nil`
public func =?<T> (variable: inout T?, value: T?) {
    if let val = value {
        variable = val
    }
}
