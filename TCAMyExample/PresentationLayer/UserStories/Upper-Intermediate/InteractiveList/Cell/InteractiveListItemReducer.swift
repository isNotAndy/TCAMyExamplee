//
//  InteractiveListItemReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import ComposableArchitecture

// MARK: - InteractiveListItemReducer

public struct InteractiveListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListItemState, InteractiveListItemAction> {
        Reduce { state, action in
            switch action {
            case .checkBoxToggle:
                state.isChecked.toggle()
            default:
                break
            }
            return .none
        }
    }
}
