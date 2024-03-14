//
//  ServiceLayerAssembly.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Foundation
import Swinject
import RealmSwift
import Monreau
import HTTPTransport

public final class ServiceLayerAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        container.register(NumberFactService.self, name: "MOCK") { resolver in
            let numberInfoDAO = container.resolve(NumberInfoDAO.self).unsafelyUnwrapped
            let transport = container.resolve(HTTPTransport.self).unsafelyUnwrapped
            return NumberFactServiceMock(dao: numberInfoDAO)
        }
        
        container.register(NumberFactService.self, name: "DATA") { resolver in
            let numberInfoDAO = container.resolve(NumberInfoDAO.self).unsafelyUnwrapped
            let transport = container.resolve(HTTPTransport.self).unsafelyUnwrapped
            let numberFactServiceImplementation = NumberFactServiceImplementation(
                transport: transport,
                dao: numberInfoDAO
            )
            return numberFactServiceImplementation
        }
        
        container.register(HTTPTransport.self) { resolver in
            HTTPTransport()
        }
    }
}
