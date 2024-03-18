//
//  PropertyWrappers.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.03.2024.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<T> {
    
    private var container = AssembliesHolder.container
    
    var wrappedValue: T {
        
        guard let resolved = container.resolve(T.self) else {
            fatalError("Нет такого \(T.self) нахуй")
        }
        return resolved
    }
}
