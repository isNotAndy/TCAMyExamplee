//
//  SimpleBindingReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 23.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - SimpleBindingReducer

public struct SimpleBindingReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<SimpleBindingState, SimpleBindingAction> {
        Scope(state: \.counter, action: /SimpleBindingAction.counter) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .changeText(let text):
                state.text = text
            case .switchToggle(let enabled):
                state.toggleEnabled = enabled
            case .moveSlider(let value):
                state.sliderValue = Double(Int(value))
            case .resetControls:
                state = SimpleBindingState()
            case .counter(.decrementButtonTapped):
                state.sliderValue = Double(min(state.counter.count, Int(state.sliderValue)))
            case .pickValue(let value):
                state.pickedColor = value
            default:
                break
            }
            return .none
        }
    }
}
