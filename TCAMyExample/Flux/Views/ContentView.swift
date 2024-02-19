//
//  ContentView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
//    private let store: Store<CounterReducer.State, CounterReducer.Action> // можно и так
    private let store: StoreOf<CounterReducer> // но так короче
    
    @ObservedObject private var viewStore: ViewStore<Int, CounterReducer.Action> // #1 - до одного параметра в State
//    @ObservedObject private var viewStore: ViewStoreOf<CounterReducer> //# 2 - до всех параметров в State
    
    init(store: StoreOf<CounterReducer>) {
        self.store = store
        
        viewStore = ViewStore(store, observe: { $0.counterValue }) // #1 - до одного параметра в State
//        viewStore = ViewStore(store, observe: { $0 }) // #2 - до всех параметров в State
    }
    
    var body: some View {
        VStack {
            Text("Counter: \(viewStore.state)")
            HStack(spacing: 25) {
                Button(action: { viewStore.send(.add) },
                       label: { Image(systemName: "minus") }
                )
                Button(action: { viewStore.send(.substruct) },
                       label: { Image(systemName: "plus") }
                )
            }
        }
    }
}
