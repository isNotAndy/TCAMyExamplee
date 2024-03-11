//
//  SimpleEffectState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - SimpleEffectState

/// `SimpleEffect` module state
///
/// Basically, `SimpleEffectState` is a type that describes the data
/// `SimpleEffect` feature needs to perform its logic and render its UI.
public struct SimpleEffectState: Equatable {
    
    // MARK: - Properties
    
    /// True if a request is being in flight
    public var isFactRequestInFlight = false
    
    /// Last obtained fact
    public var numberFact: String?
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter = CounterState()
}
