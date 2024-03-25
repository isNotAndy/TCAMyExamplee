//
//  TwoCountersStore.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 20.02.2024.
//

import ComposableArchitecture

// MARK: - DoubleCounterReducer

public struct DoubleCounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterReducer()
        }
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterReducer()
        }
    }
}

