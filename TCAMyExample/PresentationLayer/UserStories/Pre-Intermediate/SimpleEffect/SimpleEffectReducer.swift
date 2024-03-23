//
//  SimpleEffectReducer.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 22.02.2024.
//

import Foundation
import ComposableArchitecture
import HTTPTransport
import Monreau
import SDAO

// MARK: - SimpleEffectFeature

public struct SimpleEffectReducer: Reducer {
    
    // MARK: - Properties
    
    /// NumberFactService instance
    /// `@Swinjectable` numberFactService: NumberFactService
    @Swinjectable var numberFactService: NumberFactService
    
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
                let count = state.counter.count
                return numberFactService
                        .obtainFact(number: count)
                        .publish()
                        .map(NumberFactServiceAction.factObtained)
                        .catchToEffect(SimpleEffectAction.numberFactService)
            case .randomFactButtonTapped:
                state.counter.count = Int(arc4random() % 100)
                return .send(.factButtonTapped)
            case let .numberFactService(.success(.factObtained(fact))):
                state.isFactRequestInFlight = false
                state.numberFact = fact
            case .numberFactService(.failure):
                state.isFactRequestInFlight = false
            default:
                break
            }
            return .none
        }
    }
}
