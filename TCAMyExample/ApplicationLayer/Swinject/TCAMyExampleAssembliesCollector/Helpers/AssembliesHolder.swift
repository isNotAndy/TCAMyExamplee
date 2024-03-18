//
//  AssembliesHolder.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Swinject

// MARK: - AssembliesHolder

public final class AssembliesHolder {

    // MARK: - Properties

    /// Singleton container
    public static var container: Container {
        AssembliesHolder.instance.container
    }

    /// Private singleton instance
    private static let instance = AssembliesHolder()

    /// Global DI container
    private let container: Container

    // MARK: - Initializers

    /// Default initializer
    private init() {
        container = Container()
    }
}
