//
//  DAOAssembly.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Swinject
import SDAO
import RealmSwift
import Monreau

// MARK: - DAOAssemblies

public final class DAOAssembly: CollectableAssembly {
    
    // MARK: - Assemble
    
    func assemble(inContainer container: Container) {
        
        container.register(NumberInfoDAO.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            let storage = RealmStorage<NumberInfoModelObject>(configuration: configuration)
            let translator = container.resolve(NumberInfoTranslator.self).unsafelyUnwrapped
            return DAO(storage: storage, translator: translator)
        }
    }
}
