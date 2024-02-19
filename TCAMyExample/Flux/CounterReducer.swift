//
//  CounterReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import Foundation
import ComposableArchitecture

struct CounterReducer: Reducer {
    
    // так же могут быть вынесены в extension State и Action
    struct State: Equatable {
        var counterValue = 0
        var anotherField = "Some"
        var x = 4
    }
    
    enum Action {
        case add
        case substruct
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .add:
            state.counterValue += 1
            return .none
        case .substruct:
            state.counterValue -= 1
            return .none
        }
    }
    
}
