//
//  CounterReducer.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 18.02.2024.
//

import ComposableArchitecture

// MARK: - CounterReducer

public struct CounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<CounterState, CounterAction> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
            case .decrementButtonTapped:
                state.count -= 1
            }
            return .none
        }
    }
}
