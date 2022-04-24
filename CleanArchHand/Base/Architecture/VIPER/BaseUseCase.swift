//
//  BaseUseCase.swift
//  Created by Laura on 1/3/21.
//
// ¡ArchiViper, el enemigo de MVC!

import Foundation

public protocol BaseUseCase {
    associatedtype Params
    associatedtype Response
    func execute(completion: @escaping Handler<Response>)
    func execute(with params: Params, completion: @escaping Handler<Response>)

    var repository: Repository { get }
}

public extension BaseUseCase {
    func execute(completion: @escaping Handler<Response>) {
        fatalError("This method should be overriden")
    }

    func execute(with params: Params, completion: @escaping Handler<Response>) {
        fatalError("This method should be overriden")
    }
}
