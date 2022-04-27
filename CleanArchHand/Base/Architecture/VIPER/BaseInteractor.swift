//
//  BaseInteractor.swift
//  Created by Laura on 1/3/21.
//
// ¡ArchiViper, el enemigo de MVC!

import Foundation

public protocol BaseInteractor {
    associatedtype Params
    var params: Params? { get set }
    var useCaseExecutor: BaseUseCaseExecutor { get set }
}
