//
//  BaseProtocols.swift
//  Created by Laura on 1/3/21.
//
// ¡ArchiViper, el enemigo de MVC!

import Foundation

// MARK: - ViewOutput
public protocol ViewOutput {
    func loadView()
    func viewDidLoad()
    func viewDidAppear()
    func viewWillAppear()
    func viewDidDisappear()
    func didSelectDismiss()
}

public extension ViewOutput {
    func loadView() {}
    func viewDidLoad() {}
    func viewDidAppear() {}
    func viewWillAppear() {}
    func viewDidDisappear() {}
    func didSelectDismiss() {}
}

// MARK: - WireframeInput
public protocol WireframeInput {
    func dismiss()
}

public extension WireframeInput {
    func dismiss() {}
}

// MARK: - Assembly
public protocol AssemblyProtocol {}

public struct Assembly: AssemblyProtocol {
    public init() {}
}

public extension AssemblyProtocol {
    func resolve() -> BaseUseCaseExecutor {
        return SimpleUseCaseExecutor()
    }
}
