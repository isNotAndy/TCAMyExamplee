//
//  SimpleEffectView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 22.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - SimpleEffectView

public struct SimpleEffectView: View {
    
    // MARK: - Properties
    
    /// The store powering the `SimpleEffect` feature
    public let store: StoreOf<SimpleEffectReducer>
    
    // MARK: - View
    
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                HStack(spacing: 4) {
                    CounterView(
                        store: store.scope(
                            state: \.counter,
                            action: SimpleEffectAction.counter
                        )
                    )
                    Button {
                        viewStore.send(.factButtonTapped)
                    } label: {
                        HStack(spacing: 4) {
                            Spacer(minLength: 0)
                            Text("Generate fact")
                            Text("🔥")
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Button {
                    viewStore.send(.randomFactButtonTapped)
                } label: {
                    HStack(spacing: 4) {
                        Spacer(minLength: 0)
                        Text("Random fact")
                        Text("🎲")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                HStack(spacing: 4) {
                    Spacer(minLength: 0)
                    if viewStore.isFactRequestInFlight {
                        ProgressView()
                    }
                    viewStore.numberFact.map {
                        Text($0)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitle("Effect")
        }
    }
}

// MARK: - Constants


#Preview {
    SimpleEffectView(store: Store(initialState: SimpleEffectState(),
                                  reducer: SimpleEffectReducer()))
}
