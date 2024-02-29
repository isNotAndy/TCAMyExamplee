//
//  InteractiveListReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - InteractiveListReducer

/// A `InteractiveList` module reducer
///
/// It's a function that describes how to evolve the current `InteractiveListState` to the next state given an action.
/// The `InteractiveListReducer` is also responsible for returning any effects that should be run, such as API requests,
/// which can be done by returning an `Effect` value
///
/// - Note: The thread on which effects output is important. An effect's output is immediately sent
///   back into the store, and `Store` is not thread safe. This means all effects must receive
///   values on the same thread, **and** if the `Store` is being used to drive UI then all output
///   must be on the main thread. You can use the `Publisher` method `receive(on:)` for make the
///   effect output its values on the thread of your choice.
public struct InteractiveListReducer: Reducer {
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListState, InteractiveListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.items = IdentifiedArray(uniqueElements: randomizeItems())
            case .addRandomTappted:
                state.items.insert(randomizeItem(index: state.items.count), at: 0)
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
            case .deleteItemTappted(let offset):
                state.items.remove(atOffsets: offset)
            case .item(id: _, action: .checkBoxToggle):
                return .send(.removeCheckedItems)
                    .debounce(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation()
                    )
            }
            return . none
        }
        .forEach(\.items, action: /InteractiveListAction.item) {
            CellReducer()
        }
    }
}

// MARK: - Private

private let colors = [
    "#033270",
    "#1368AA",
    "#4091C9",
    "#9DCEE2",
    "#FEDFD4",
    "#F29479",
    "#F26A4F",
    "#EF3C2D",
    "#CB1B16",
    "#65010C"
]

private let images = [
    "sun.max.fill",
    "heart.fill",
    "allergens",
    "hourglass"
]

private func randomizeItem(index: Int) -> CellState {
    CellState(
        id: UUID(),
        title: .generatedName,
        image: images.randomElement().unsafelyUnwrapped,
        color: colors.randomElement().unsafelyUnwrapped
    )
}

private func randomizeItems() -> [CellState] {
    (0..<Int.random(in: 10...13)).map { index in
        randomizeItem(index: index)
    }
}
