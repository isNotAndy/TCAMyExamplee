//
//  CounterState.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 22.02.2024.
//

import Foundation

// MARK: - CounterState

/// `CounterState` module state
///
/// Basically, `CounterState` is a type that describes the data
/// `CounterState` feature needs to perform its logic and render its UI.
public struct CounterState: Equatable {
    
    // MARK: - Properties
    
    /// Counter count value
    public var count = 0
}
