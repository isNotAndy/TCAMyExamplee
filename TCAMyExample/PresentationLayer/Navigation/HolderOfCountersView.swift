//
//  WrapperView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 28.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - HolderOfCountersView

public struct HolderOfCountersView: View {
    
    // MARK: - Properties
    
    /// The store powering the `LuckyDriverWrapper` reducer
    public let store: StoreOf<HolderOfCountersReducer>
    
    // MARK: - Initializers
    
    public init(store: StoreOf<HolderOfCountersReducer>) {
        self.store = store
    }
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Button("Open Counter") {
                    viewStore.send(.counterButtonTapped)
                }
                Button("Open double Counter") {
                    viewStore.send(.doubleCounterButtonTapped)
                }
                Text("Everything click on counter: \(viewStore.totalClicks)")
                Text("Evrything click on inc counter: \(viewStore.totalPositiveClicks)")
                Text("Evrything click on dec counter: \(viewStore.totalNegativeClicks)")
            }
            .background(
                NavigationLink(
                    isActive: viewStore.$isDoubleCounterActive,
                    destination: {
                        IfLetStore(
                            store.scope(
                                state: \.doubleCounter,
                                action: HolderOfCountersAction.doubleCounter
                            ),
                            then: DoubleCounterView.init
                        )
                    },
                    label: {
                        EmptyView()
                    }
                )
            )
            .background(
                NavigationLink(
                    isActive: viewStore.$isCounterActive,
                    destination: {
                        IfLetStore(
                            store.scope(
                                state: \.counter,
                                action: HolderOfCountersAction.counter
                            ),
                            then: CounterView.init
                        )
                    },
                    label: {
                        EmptyView()
                    }
                )
            )
        }
    }
}

