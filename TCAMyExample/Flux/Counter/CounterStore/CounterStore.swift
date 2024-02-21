//
//  CounterReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CounterStore

public struct Counter: Reducer {
    // MARK: -  State
    public struct State: Equatable {
        var counterValue = 0
    }
    
    // MARK: -  Action
    public enum Action: Equatable {
        case add
        case substruct
    }
    
    // MARK: -  Reducer
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .substruct:
            state.counterValue -= 1
        case .add:
            state.counterValue += 1
        }
        return .none
    }
}
