//
//  NumberInfoTranslator.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 07.03.2024.
//

import Foundation
import SDAO
import Monreau

// MARK: - NumberInfoTranslator

public final class NumberInfoTranslator {
    
    // MARK: - Aliases
    
    public typealias PlainModel = NumberInfoPlainObject
    public typealias DatabaseModel = NumberInfoModelObject
    
    /// NumberInfo storage
    private lazy var numberInfoStorage = RealmStorage<NumberInfoModelObject>(configuration: self.configuration)
    
    /// RealConfiguration instance
    private let configuration: RealmConfiguration
    
    // MARK: - Initializers
    
    public init (configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

// MARK: - Translator

extension NumberInfoTranslator: Translator {
    public func translate(model: DatabaseModel) throws -> PlainModel {
        NumberInfoPlainObject (
            id: model.id,
            number: model.number,
            title: model.title
        )
    }
    
    public func translate(plain: PlainModel) throws -> DatabaseModel {
        let model = try numberInfoStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? DatabaseModel()
        try translate(from: plain, to: model)
        return model
    }
    
    public func translate(from plain: PlainModel, to databaseModel: DatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.id
        databaseModel.number = plain.number
        databaseModel.title = plain.title
    }
}
