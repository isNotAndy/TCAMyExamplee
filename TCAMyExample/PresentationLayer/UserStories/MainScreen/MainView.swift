//
//  MainView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 19.02.2024.
//

import SwiftUI
import ComposableArchitecture
import HTTPTransport

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
                        .navigationTitle("Easy Counter")
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
                        SimpleEffectView(
                            store: Store(
                                initialState: SimpleEffectState(),
                                reducer: SimpleEffectReducer()
                                                     )
                        )
                    }
                    
                    NavigationLink("Simple Binding") {
                        SimpleBindingView(
                            store: Store(
                                initialState: SimpleBindingState(),
                                reducer: SimpleBindingReducer()
                                                      )
                        )
                        .navigationTitle("Simple Binding")
                    }
                    
                    NavigationLink("Simple Optional") {
                        SimpleOptionalView(
                            store: Store(
                                initialState: SimpleOptionalState(),
                                reducer: SimpleOptionalReducer()
                                                       )
                        )
                        .navigationTitle("Simple optional")
                    }
                    
                    NavigationLink("Alert And Sheet") {
                        AlertAndSheetView(
                            store: Store(
                                initialState: AlertAndSheetState(),
                                reducer: AlertAndSheetReducer()
                                                      )
                        )
                        .navigationTitle("Simple optional")
                    }
                    
                    NavigationLink("Holder of Counters") {
                        HolderOfCountersView(
                            store: Store(
                                initialState: HolderOfCountersState(),
                                reducer: HolderOfCountersReducer()
                                                         )
                        )
                        .navigationTitle("Holder of Counters")
                    }
                    NavigationLink {
                        InteractiveListView(
                            store: Store(
                                initialState: InteractiveListState(defaultCount: 0),
                                reducer: InteractiveListReducer()
                            )
                        )
                        .navigationTitle("Interactive List")
                    } label: {
                        HStack {
                            Text("Interactive List (API)")
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainView()
}