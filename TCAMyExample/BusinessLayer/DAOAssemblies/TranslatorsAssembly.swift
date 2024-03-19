//
//  TranslatorsAssembly.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 13.03.2024.
//

import Foundation
import Swinject
import Monreau

// MARK: - TranslatorsAssembly

public final class TranslatorsAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        container.register(NumberInfoTranslator.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return NumberInfoTranslator(configuration: configuration)
        }
    }
}
