//
//  SimpleOptionalReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 23.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - SimpleOptionalReducer

public struct SimpleOptionalReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<SimpleOptionalState, SimpleOptionalAction> {
        Reduce { state, action in
            switch action {
            case .toggleOptional:
                state.counter = state.counter == nil ? SimpleBindingState() : nil
            default:
                break
            }
            return .none
        }
        .ifLet(\.counter, action: /SimpleOptionalAction.binding) {
            SimpleBindingReducer()
        }
    }
}
