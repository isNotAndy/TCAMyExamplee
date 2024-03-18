//
//  PropertyWrappers.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.03.2024.
//

import Foundation
import Swinject

// MARK: - Swinjectable

@propertyWrapper
public struct Swinjectable<T> {
    
    // MARK: - Property
    
    private let container = AssembliesHolder.container
    
    public let wrappedValue: T
    
    // MARK: - Initializers
    
    public init() {
        self.wrappedValue = container.resolve(T.self).unsafelyUnwrapped
    }
}
