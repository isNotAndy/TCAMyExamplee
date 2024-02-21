//
//  CounterReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct Counter: Reducer {
    // так же могут быть вынесены в extension State и Action
    struct State: Equatable {
        var counterValue = 0
    }
    
    enum Action: Equatable {
        case add
        case substruct
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .substruct:
            state.counterValue -= 1
            return .none
        case .add:
            state.counterValue += 1
            return .none
        }
    }
    
}