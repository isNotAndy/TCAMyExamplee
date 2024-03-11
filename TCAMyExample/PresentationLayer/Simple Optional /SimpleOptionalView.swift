//
//  SimpleOptionalView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 23.02.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - SimpleOptionalView

public struct SimpleOptionalView: View {
    
    // MARK: - Properties
    
    /// The store powering the `SimpleOptional` feature
    public let store: StoreOf<SimpleOptionalReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section {
                    IfLetStore(
                        store.scope(
                            state: \.counter,
                            action: SimpleOptionalAction.counter
                        ),
                        then: { store in
                            HStack {
                                Text(viewStore.counterDescription)
                                Spacer()
                                CounterView(store: store)
                                    .buttonStyle(BorderlessButtonStyle())
                            }
                        },
                        else: { Text(viewStore.counterDescription) }
                    )
                    Button("Toggle") {
                        viewStore.send(.toggleOptional)
                    }
                }
            }
            .navigationTitle("Simple optional")
        }
    }
}
