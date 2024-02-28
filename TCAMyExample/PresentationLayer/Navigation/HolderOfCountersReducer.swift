//
//  WrapperReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 28.02.2024.
//

import ComposableArchitecture

// MARK: - HolderOfCountersReducer

public struct HolderOfCountersReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<HolderOfCountersState, HolderOfCountersAction> {
//        BindingReducer()
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
//                state.isCounterActive = true
//            case .binding(\.$isCounterActive):
//                if !state.isCounterActive {
//                    state.counter = nil
//                }
            case .doubleCounterButtonTapped:
                state.doubleCounter = DoubleCounterState()
//                state.isDoubleCounterActive = true
//            case .binding(\.$isDoubleCounterActive):
//                if !state.isDoubleCounterActive {
//                    state.doubleCounter = nil
//                }
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
