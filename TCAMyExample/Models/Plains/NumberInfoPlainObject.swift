//
//  NumberInfoPlainObject.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 03.04.2023.
//

import Foundation

// MARK: - NumberInfoPlainObject

public struct NumberInfoPlainObject: Codable, Equatable, Identifiable {
    
    // MARK: - Properties
    
    /// ID
    public let id: String
    
    /// Number
    public let number: Int
    
    /// Something info about number
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
    
    public static func randomizeItems() -> Self {
        (0..<Int.random(in: 10..<11)).map { index in
            NumberInfoPlainObject.random()
        }
    }
    
    public static func generateCount(count: Int) -> Self {
        (0..<count).map { _ in NumberInfoPlainObject.random() }
    }
}
