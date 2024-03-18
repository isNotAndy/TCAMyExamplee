//
//  realm.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 07.03.2024.
//

import RealmSwift
import Monreau
import SDAO

final class DaoProvider {
    
    // MARK: - Property
    
    /// singleton
    static let shared = DaoProvider()
    
    private let configuration = RealmConfiguration(
        databaseFileName: "TCAMyExample.realm",
        databaseVersion: 1)
    
    private(set) lazy var numberInfoDAO = DAO(
        storage: RealmStorage<NumberInfoModelObject>(configuration: configuration),
        translator: NumberInfoTranslator(configuration: configuration)
    )
}
