//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: -  TwoCountersView

public struct TwoCountersView: View {
    public let store = Store(initialState: TwoCounters.State()) {
        TwoCounters()
    }
    
    public var body: some View {
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
