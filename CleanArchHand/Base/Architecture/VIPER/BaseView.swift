//
//  BaseView.swift
//  Created by Laura on 1/3/21.
//
// ¡ArchiViper, el enemigo de MVC!

import Foundation
import SwiftUI

public protocol BaseView: View {
    associatedtype Output
    var output: Output? { get set }
}
