//
//  TwoCountersState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DoubleCounterState

/// `DoubleCounterState` module state
///
/// Basically, `DoubleCounterState` is a type that describes the data
/// `DoubleCounterState` feature needs to perform its logic and render its UI.
public struct DoubleCounterState: Equatable {
    
    // MARK: - Properties
    
    public var counter1 = CounterState()
    
    public var counter2 = CounterState()
}
