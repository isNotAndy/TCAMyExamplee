//
//  CellState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation

// MARK: - CellState

/// `Cell` module state
///
/// Basically, `CellState` is a type that describes the data
/// `Cell` reducer needs to perform its logic and render its UI.
public struct CellState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: UUID
    
    /// Title value
    public let title: String
    
    /// Image name
    public let image: String
    
    /// Hex name
    public let color: String
    
    /// True if current item is checked
    public var isChecked = false
}

// MARK: - Mock

extension CellState {
    
    public static func randomizeItem(index: Int) -> Self {
        CellState(
            id: UUID(),
            title: .generatedName,
            image: .randomImage(),
            color: .randomColor()
        )
    }
}

// MARK: - Array+Mock

extension Array where Element == CellState {
    
    public static func randomizeItems() -> Self {
        (0..<Int.random(in: 10...13)).map { index in
            CellState.randomizeItem(index: index)
        }
    }
}
