//
//  CounterReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import OldTCA

// MARK: - CounterFeature

public struct CounterFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public func reduce(into state: inout CounterState, 
                       action: CounterAction) -> EffectTask<CounterAction> {
        switch action {
        case .incrementsButtonTapped:
            state.count += 1
        case .decremetnButtonTapped:
            state.count -= 1
        }
        return .none
    }
}
