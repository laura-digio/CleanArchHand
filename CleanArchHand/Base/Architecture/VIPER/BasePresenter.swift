//
//  BasePresenter.swift
//  Created by Laura on 1/3/21.
//
// ¡ArchiViper, el enemigo de MVC!

import Foundation

public protocol BasePresenter {
    associatedtype Wireframe
    var wireframeInput: Wireframe? { get set }
}
