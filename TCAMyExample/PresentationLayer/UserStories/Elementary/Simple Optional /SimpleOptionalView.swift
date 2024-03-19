//
//  SimpleOptionalView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.02.2024.
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
                Button("Toggle") {
                    viewStore.send(.toggleOptional)
                }
                
                IfLetStore(
                    store.scope(
                        state: \.counter,
                        action: SimpleOptionalAction.binding
                    ),
                    then: { store in
                        Text(viewStore.counterDescription)
                        SimpleBindingView(store: store)
                    },
                    else: { Text(viewStore.counterDescription) }
                )
                .padding(.bottom, 8)
                .padding(.top, 8)
            }
            .animation(.bouncy(duration: 0.1))
        }
    }
}
