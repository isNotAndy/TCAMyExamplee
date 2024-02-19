//
//  TryWithViewStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct TryWithViewStore: View {
    
    private let store: StoreOf<CounterReducer>
    
    init(store: StoreOf<CounterReducer>) {
        self.store = store
    }
    
    var body: some View {
        // WithViewStore - обычная суи вьюха
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Counter: \(viewStore.counterValue)")
                Button(action: { viewStore.send(.add) },
                       label: { Text("add") }
                )
                Button(action: { viewStore.send(.substruct) },
                       label: { Text("Sub") }
                )
            }
        }
    }
}

