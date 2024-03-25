//
//  NumberInfoPlainObject.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 03.04.2023.
//

import SDAO
import Foundation

// MARK: - NumberInfoPlainObject

/// @realm
public struct NumberInfoPlainObject: Codable, Equatable, Identifiable, Plain {
    
    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }
    
    /// ID of the number information.
    public let id: String

    /// The numerical representation of the number.
    public let number: Int

    /// A descriptive title providing information about the number.
    public let title: String
}

// MARK: - Mock

extension NumberInfoPlainObject {
    
    public static func random() -> Self {
        NumberInfoPlainObject(
            id: UUID().uuidString,
            number: .randomNumber(),
            title: .generatedName
        )
    }
}

// MARK: - Array+Mock

extension Array where Element == NumberInfoPlainObject {
    
    public static func random() -> Self {
        (0..<Int.random(in: 10..<11)).map { index in
            NumberInfoPlainObject.random()
        }
    }
    
    public static func random(count: Int) -> Self {
        (0..<count).map { _ in NumberInfoPlainObject.random() }
    }
}
