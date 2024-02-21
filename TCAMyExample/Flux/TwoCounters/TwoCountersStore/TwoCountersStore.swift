//
//  TwoCountersStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - TwoCountersStore

struct TwoCounters: Reducer {
    struct State: Equatable {
        var firstCounter = Counter.State()
        var secondCounter = Counter.State()
    }
    
    enum Action: Equatable {
        case firstCounter(Counter.Action)
        case secondCounter(Counter.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.firstCounter, action: /Action.firstCounter) {
            Counter()
        }
        Scope(state: \.secondCounter, action: /Action.secondCounter) {
            Counter()
        }
    }
}

