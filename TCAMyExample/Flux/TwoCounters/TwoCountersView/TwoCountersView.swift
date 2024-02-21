//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: -  TwoCountersView

struct TwoCountersView: View {
    let store = Store(initialState: TwoCounters.State()) {
        TwoCounters()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Counter 1")
                CounterView(store: store.scope(state: \.firstCounter, action: { .firstCounter($0) }))
            }
            HStack {
                Text("Counter 2")
                CounterView(store: store.scope(state: \.secondCounter, action: { .secondCounter($0) }))
            }
        }
    }
}

#Preview {
    TwoCountersView()
}
