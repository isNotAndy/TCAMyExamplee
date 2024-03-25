//
//  DAOAssembly.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 13.03.2024.
//

import Swinject
import SDAO
import RealmSwift
import Monreau

// MARK: - DAOAssembly

public final class DAOAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        container.register(NumberInfoDAO.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            let storage = RealmStorage<NumberInfoModelObject>(configuration: configuration)
            let translator = container.resolve(NumberInfoTranslator.self).unsafelyUnwrapped
            return DAO(storage: storage, translator: translator)
        }
    }
}