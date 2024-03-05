//
//  WrapperState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 28.02.2024.
//

import ComposableArchitecture

// MARK: - HolderOfCountersState

public struct HolderOfCountersState: Equatable {
    
    // MARK: - Properties
    
    /// Total clicks on each child counters
    public var totalClicks: Int {
        totalNegativeClicks + totalPositiveClicks
    }
    
    /// Total positive clicks on each child counters
    public var totalPositiveClicks = 0
    
    /// Total negative clicks on each child counters
    public var totalNegativeClicks = 0
    
    
    // MARK: - Children
    
    /// `CounterState` instance
    ///
    /// It's an instance of `counter` submodule.
    /// We use it here to be able to integrate `counter` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    @PresentationState public var counter: CounterState?
    
    /// `DoubleCounterState` instance
    ///
    /// It's an instance of `doubleCounter` submodule.
    /// We use it here to be able to integrate `doubleCounter` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `doubleCounter` module all changes will be saved here.
    @PresentationState public var doubleCounter: DoubleCounterState?
    
//    // MARK: - Navigation
//    
//    /// Indicates is user transport module active
//    @BindingState public var isCounterActive = false
//    @BindingState public var isDoubleCounterActive = false
}
