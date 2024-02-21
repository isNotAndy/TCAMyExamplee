//
//  TwoCountersStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - TwoCountersStore

public struct TwoCounters: Reducer {
    
    // MARK: -  State
    public struct State: Equatable {
        var firstCounter = Counter.State()
        var secondCounter = Counter.State()
    }
    
    // MARK: -  Action
    public enum Action: Equatable {
        case firstCounter(Counter.Action)
        case secondCounter(Counter.Action)
    }
    
    // MARK: -  View
    public var body: some Reducer<State, Action> {
        Scope(state: \.firstCounter, action: /Action.firstCounter) {
            Counter()
        }
        Scope(state: \.secondCounter, action: /Action.secondCounter) {
            Counter()
        }
    }
}

