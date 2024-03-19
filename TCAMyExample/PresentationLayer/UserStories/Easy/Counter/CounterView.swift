//
//  TryWithViewStore.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CounterView

/// A visual representation of `CounterView` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<CounterViewState, CounterViewAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct CounterView: View {
    
    /// The store powering the `Counter` feature
    public let store: StoreOf<CounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 4) {
                Button {
                    viewStore.send(.decrementButtonTapped)
                } label: {
                    Image(systemName: "minus")
                }
                .buttonStyle(PlainButtonStyle())
                
                Text("\(viewStore.count)")
                    .monospacedDigit()
                
                Button {
                    viewStore.send(.incrementButtonTapped)
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

// MARK: - Preview

#Preview {
    CounterView(store: .init(initialState: CounterState(), 
                             reducer: CounterReducer()))
}
