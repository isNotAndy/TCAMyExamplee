//
//  TranslatorsAssembly.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Foundation
import Swinject
import Monreau

// MARK: - TranslatorsAssembly

public final class TranslatorsAssembly: CollectableAssembly {
    
    // MARK: - Assemble
    
    func assemble(inContainer container: Container) {
        
        container.register(NumberInfoTranslator.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return NumberInfoTranslator(configuration: configuration)
        }
    }
}
