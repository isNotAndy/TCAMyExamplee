//
//  TwoCountersState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import OldTCA

// MARK: - DoubleCounterState

public struct DoubleCounterState: Equatable {
    
    // MARK: - Properties
    
    var counter1 = CounterState()
    
    var counter2 = CounterState()
}
