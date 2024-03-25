//
//  TwoCountersState.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 22.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DoubleCounterState

/// `DoubleCounter` module state
///
/// Basically, `DoubleCounterState` is a type that describes the data
/// `DoubleCounterState` feature needs to perform its logic and render its UI.
public struct DoubleCounterState: Equatable {
    
    // MARK: - Properties
    
    /// `сounterState` instance
    ///
    /// It's an instance of `counter1` submodule.
    /// We use it here to be able to integrate `counter1` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter1` module all changes will be saved here.
    public var counter1 = CounterState()
    
    /// `сounterState` instance
    ///
    /// It's an instance of `counter2` submodule.
    /// We use it here to be able to integrate `counter2` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter2` module all changes will be saved here.
    public var counter2 = CounterState()
}
