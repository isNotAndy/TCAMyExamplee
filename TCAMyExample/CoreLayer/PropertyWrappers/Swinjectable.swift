//
//  PropertyWrappers.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 18.03.2024.
//

import Foundation
import Swinject

// MARK: - Swinjectable

@propertyWrapper
public struct Swinjectable<T> {
    
    // MARK: - Properties
    
    /// Swinject container for resolving dependencies.
    private let container = AssembliesHolder.container
    
    /// The wrapped value representing the resolved dependency.
    public let wrappedValue: T
    
    // MARK: - Initializers
    
    public init() {
        self.wrappedValue = container.resolve(T.self).unsafelyUnwrapped
    }
}
