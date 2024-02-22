//
//  TwoCountersStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import OldTCA

// MARK: - DoubleCounterFeature

public struct DoubleCounterFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1,
              action: /DoubleCounterAction.counter1) {
            CounterFeature()
        }
        Scope(state: \.counter2,
              action: /DoubleCounterAction.counter2) {
            CounterFeature()
        }
    }
}

