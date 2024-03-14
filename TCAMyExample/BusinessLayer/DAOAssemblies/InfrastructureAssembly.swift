//
//  InfrastructureAssembly.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Foundation
import Swinject
import RealmSwift
import ServiceCore
import Monreau

public final class InfrastructureAssembly: CollectableAssembly {
    
    init() { }
    
    func assemble(inContainer container: Container) {
        
        container.register(Realm.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            do {
                func pathForFileName(_ fileName: String) -> URL? {
                    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
                    guard let realmPath = documentDirectory?.appendingPathComponent(fileName) else {
                        return nil
                    }
                    return URL(string: realmPath)
                }
                let configuration = resolver.resolve(RealmConfiguration.self)!
                var config =  Realm.Configuration.defaultConfiguration
                config.schemaVersion = configuration.databaseVersion
                config.fileURL = pathForFileName(configuration.databaseFileName)
                return try Realm(configuration: config)
            } catch {
                fatalError(":(")
            }
        }
        .inObjectScope(.container)
        
        container.register(RealmConfiguration.self) { resolver in
            RealmConfiguration(
                databaseFileName: "DAOHuiao.realm",
                databaseVersion: 1
            )
        }
    }
}
