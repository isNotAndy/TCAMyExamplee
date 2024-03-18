//
//  CollectableAssembly.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Swinject

// MARK: - CollectableAssembly

protocol CollectableAssembly {

    init()

    /// Method for registering your assemblies
    ///
    /// - Parameter container: Container for dependency ijection
    func assemble(inContainer container: Container)
}

extension CollectableAssembly {

    /// Container with all dependencies
    var container: Container {
        AssembliesHolder.container
    }

    /// Wrapper for protocol's assemble method
    func assemble() {
        assemble(inContainer: container)
    }
}
