//
//  WrapperReducer.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 28.02.2024.
//

import ComposableArchitecture

// MARK: - HolderOfCountersReducer

public struct HolderOfCountersReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<HolderOfCountersState, HolderOfCountersAction> {
        Reduce { state, action in
            switch action {
            case .counter(.presented(.decrementButtonTapped)),
                 .doubleCounter(.presented(.counter1(.decrementButtonTapped))),
                 .doubleCounter(.presented(.counter2(.decrementButtonTapped))):
                state.totalNegativeClicks += 1
            case .counter(.presented(.incrementButtonTapped)),
                 .doubleCounter(.presented(.counter1(.incrementButtonTapped))),
                 .doubleCounter(.presented(.counter2(.incrementButtonTapped))):
                state.totalPositiveClicks += 1
            case .counterButtonTapped:
                state.counter = CounterState()
            case .doubleCounterButtonTapped:
                state.doubleCounter = DoubleCounterState()
            default:
                break
            }
            return .none
        }
        .ifLet(\.$counter, action: /HolderOfCountersAction.counter) {
            CounterReducer()
        }
        .ifLet(\.$doubleCounter, action: /HolderOfCountersAction.doubleCounter) {
            DoubleCounterReducer()
        }
    }
}