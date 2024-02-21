//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct TwoCountersView: View {
    let store = Store(initialState: TwoCounters.State()) {
        TwoCounters()
    }
    
    var body: some View {
        Form {
            HStack {
                Text("Counter 1")
                Spacer()
                CounterView(store: self.store.scope(state: \.firstCounter, action: { .firstCounter($0) }))
            }
//            HStack {
//                Text("Counter 2")
//                Spacer()
//                CounterView(store: self.store.scope(state: \.secondCounter, action: { .secondCounter($0) }))
//            }
        }
        .navigationTitle("Two counters")
    }
}

#Preview {
    TwoCountersView()
}
