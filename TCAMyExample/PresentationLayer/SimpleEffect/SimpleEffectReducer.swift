//
//  SimpleEffectReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - SimpleEffectFeature

public struct SimpleEffectReducer: Reducer {
    
    // MARK: - Properties
    
    /// NumberFactService instance
    public let numberFactService = NumberFactServiceImplementation()
    
    // MARK: - Reducer
    
    public var body: some Reducer<SimpleEffectState, SimpleEffectAction> {
        Scope(state: \.counter, action: /SimpleEffectAction.counter) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .factButtonTapped:
                state.numberFact = nil 
                state.isFactRequestInFlight = true
                return .run { [count = state.counter.count] send in
                    await send(.numberFactResponse(
                        TaskResult {
                            try await numberFactService.generateFact(number: count)
                        }
                    ))
                }
            case .randomFactButtonTapped:
                state.counter.count = Int(arc4random() % 100)
                return .send(.factButtonTapped)
            case let .numberFactResponse(.success(fact)):
                state.isFactRequestInFlight = false
                state.numberFact = fact
            case .numberFactResponse(.failure):
                state.isFactRequestInFlight = false
            default:
                break
            }
            return .none
        }
    }
}
