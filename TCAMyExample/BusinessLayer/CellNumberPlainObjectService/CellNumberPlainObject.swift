//
//  ExplorerChallengePlainObject.swift
//  Chibiverse
//
//  Created by Gleb Kovalenko on 03.04.2023.
//

import Foundation

// MARK: - ExplorerChallengePlainObject

public struct CellNumberPlainObject: Codable, Equatable, Identifiable {
    
    // MARK: - Properties
    
    public let id: String
    public let number: Int
    public let title: String
}

// MARK: - Mock

extension CellNumberPlainObject {
    
    public static func randomizeItem(index: Int) -> Self {
        CellNumberPlainObject(
            id: UUID().uuidString,
            number: .randomNumber(),
            title: .generatedName
        )
    }
}

// MARK: - Array+Mock

extension Array where Element == CellNumberPlainObject {
    
    public static func randomizeItems() -> Self {
        (0..<Int.random(in: 10..<11)).map { index in
            CellNumberPlainObject.randomizeItem(index: index)
        }
    }
    
    public static func generateCount(count: Int) -> Self {
        (0..<count).map { _ in CellNumberPlainObject.randomizeItem(index: count) }
    }
}
