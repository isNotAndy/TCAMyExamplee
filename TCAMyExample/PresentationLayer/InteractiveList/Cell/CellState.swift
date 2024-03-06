//
//  CellState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation
import TCANetworkReducers

// MARK: - CellState

/// `Cell` module state
///
/// Basically, `CellState` is a type that describes the data
/// `Cell` reducer needs to perform its logic and render its UI.
public struct CellState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: String
    
    /// Title value
    public let title: String
    
    /// Image name
    public let image: String
    
    /// Hex name
    public let color: String
    
    /// number value
    public let number: Int
    
    /// True if current item is checked
    public var isChecked = false
}

// MARK: - Initializer

extension CellState {
    
    public init(plain: NumberInfoPlainObject) {
        self.id = plain.id
        self.number = plain.number
        self.title = plain.title
        switch number {
        case 0...30:
            self.color = .randomColor()
        case 31...63:
            self.color = .randomColor()
        default:
            self.color = .randomColor()
        }
        switch number {
        case 0...30:
            self.image = .randomImage()
        case 31...63:
            self.image = .randomImage()
        default:
            self.image = .randomImage()
        }
    }
}
