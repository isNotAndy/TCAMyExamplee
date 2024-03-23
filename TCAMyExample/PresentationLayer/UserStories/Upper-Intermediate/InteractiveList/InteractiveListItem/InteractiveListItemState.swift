//
//  InteractiveListItemState.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 29.02.2024.
//

import Foundation
import TCANetworkReducers

// MARK: - InteractiveListItemState

/// `InteractiveListItem` module state
///
/// Basically, `InteractiveListItemState` is a type that describes the data
/// `InteractiveListItem` reducer needs to perform its logic and render its UI.
public struct InteractiveListItemState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: String
    
    /// Title value
    public let title: String
    
    /// Image name
    public let image: String
    
    /// Hex name
    public let color: String
    
    /// Number value
    public let number: Int
    
    /// True if current item is checked
    public var isChecked = false
}

// MARK: - Initializers

extension InteractiveListItemState {
    
    public init(plain: NumberInfoPlainObject) {
        self.id = plain.id
        self.number = plain.number
        self.title = plain.title
        self.color = .randomColor()
        self.image = .randomImage()
    }
}
