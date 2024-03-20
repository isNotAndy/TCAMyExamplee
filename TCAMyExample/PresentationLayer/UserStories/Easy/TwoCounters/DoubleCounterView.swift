//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 20.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - DoubleCounterView

/// A visual representation of `DoubleCounterView` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<DoubleCounterState, DoubleCounterAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct DoubleCounterView: View {
    
    // MARK: - Properties
    
    /// `DoubleCounterView` module `Store` instance
    public let store: StoreOf<DoubleCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        Form {
            ControlView {
                CounterView(
                    store: store.scope(
                        state: \.counter1,
                        action: DoubleCounterAction.counter1
                    )
                )
            }
            ControlView {
                CounterView(
                    store: store.scope(
                        state: \.counter2,
                        action: DoubleCounterAction.counter2
                    )
                )
            }
        }
        .padding([.trailing], 8)
        .navigationBarTitle("Composition")
    }
}
    
// MARK: - ViewBuilder

private struct ControlView<Content: View>: View {
    
    // MARK: - Properties

    let content: Content
    
    // MARK: - Initializers
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - View
    
    public var body: some View {
        HStack {
            content
        }
    }
}

// MARK: - Preview

#Preview {
    DoubleCounterView(store: .init(initialState: DoubleCounterState(), 
                                   reducer: DoubleCounterReducer()))
}
