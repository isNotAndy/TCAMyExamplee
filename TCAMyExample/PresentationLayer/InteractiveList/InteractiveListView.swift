//
//  InteractiveListView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - InteractiveListView

/// A visual representation of `InteractiveList` module.
/// Here we define the view that displays the feature.
/// It holds onto a `StoreOf<InteractiveListState, InteractiveListAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct InteractiveListView: View {

    // MARK: - Properties

    /// The store powering the `InteractiveList` feature
    public let store: StoreOf<InteractiveListReducer>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section {
                    ForEachStore(
                        store.scope(
                            state: \.items,
                            action: InteractiveListAction.item
                        ),
                        content: CellView.init
                    )
                    .onDelete { viewStore.send(.deleteItemTappted($0)) }
                }.textCase(nil)
            }
            .navigationBarItems(trailing:
                Button {
                    viewStore.send(.addRandomTappted, animation: .default)
                } label: {
                    Text("Add")
                }
            )
            .navigationTitle("Basic list")
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

