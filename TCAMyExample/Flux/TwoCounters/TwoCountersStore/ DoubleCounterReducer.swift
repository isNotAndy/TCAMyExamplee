//
//  TwoCountersStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - DoubleCounterReducer

public struct DoubleCounterReducer: Reducer {
    
    // MARK: - Feature
    
    public var body: some Reducer<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterReducer()
        }
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterReducer()
        }
    }
}

