//
//  MainView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - MainView

public struct MainView: View {
    
    // MARK: - View
    
    public var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Easy Counter") {
                        CounterView(
                            store: Store(
                                initialState: CounterState(),
                                reducer: CounterReducer()
                            )
                        )
                    }
                    NavigationLink("Two Counters") {
                        DoubleCounterView(
                            store: Store(
                                initialState: DoubleCounterState(),
                                reducer: DoubleCounterReducer()
                            )
                        )
                    }
                    NavigationLink("Simple Effect") {
                        SimpleEffectView(store: Store(initialState: SimpleEffectState(),
                                                      reducer: SimpleEffectReducer()
                            )
                        )
                    }
                    NavigationLink("Simple Effect") {
                        SimpleOptionalView(store: Store(initialState: SimpleOptionalState(),
                                                      reducer: SimpleOptionalReducer()
                            )
                        )
                    }
                }
                .navigationTitle("Two counters")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainView()
}
