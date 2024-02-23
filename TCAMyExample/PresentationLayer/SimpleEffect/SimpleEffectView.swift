//
//  SimpleEffectView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
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

extension SimpleEffectView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how to use side effects with a feature built with the TCA.

        A side effect is a work item that needs to be performed in the outside world. For example, \
        an API request to an external service over HTTP

        Many things  in our applications can be represented as side effects, such as timers, network requests, \
        database requests, events observing, socket connections debouncing, throttling and delaying, etc.

        This application has two simple side effects:

        • Tapping "Generate fact" will trigger an API request to load a fact about the number
        • Tapping "Random fact" will change current number value and do the same

        Both effects are handled by the reducer, and a full test suite is written to confirm \
        that the effects behave in the way we expect.

        """
    }
}

#Preview {
    SimpleEffectView(store: Store(initialState: SimpleEffectState(),
                                  reducer: SimpleEffectReducer()))
}
