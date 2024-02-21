//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - TwoCountersView

public struct TwoCountersView: View {
    
    // MARK: - Store
    
    public let store = Store(initialState: TwoCounters.State()) {
        TwoCounters()
    }
    
    // MARK: - View
    
    public var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Text("Counter 1")
                CounterView(store: store.scope(state: \.firstCounter,
                                               action: { .firstCounter($0) }))
            }
            HStack(spacing: 4) {
                Text("Counter 2")
                CounterView(store: store.scope(state: \.secondCounter,
                                               action: { .secondCounter($0) }))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    TwoCountersView()
}
