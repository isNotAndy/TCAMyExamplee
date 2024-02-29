//
//  CellReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import ComposableArchitecture

// MARK: - CellReducer

public struct CellReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<CellState, CellAction> {
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
