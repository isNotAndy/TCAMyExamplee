//
//  InteractiveListReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation
import ComposableArchitecture
import ServiceCore
import HTTPTransport
import TCANetworkReducers

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
    
    /// NumberFactService instance
    public let numberFactService: NumberFactService
    
    /// CellNumberFact instance
    public let cellNumberFactService =  NumberFactServiceImplementation(transport: HTTPTransport())
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListState, InteractiveListAction> {
        BindingReducer()
        Scope(state: \.reloadableCellState, 
              action: /InteractiveListAction.reloadableCell) {
            IDRelodableReducer { count in
                cellNumberFactService
                    .obtainNumbersInfo(count: count)
                    .publish()
                    .eraseToAnyPublisher()
            }
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.items = []
                return .send(.reloadableCell(.load))
            case .addRandomTapped:
                state.items.insert(
                    CellState(
                        plain: .random()
                    ),
                    at: 0
                )
            case .reloadableCell(.response(.success(let plains))):
                state.items = IdentifiedArray(
                    uniqueElements: plains.map(CellState.init)
                    )
            case .reloadableCell(.response(.failure(let error))):
                state.alert = AlertState(
                    title: TextState("\(error)"),
                    message: TextState("GGWP"),
                    buttons: [
                        .cancel(TextState("Cancel")),
                    ]
                )
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
            case .deleteItemTapped(let offset):
                state.items.remove(atOffsets: offset)
            case .item(id: _, action: .checkBoxToggle):
                return .send(.removeCheckedItems)
                    .debounce(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation()
                    )
            case .item(id: let itemID, action: .itemTapped):
                guard let item = state.items[id: itemID] else {
                    return .none
                }
                return numberFactService
                    .obtainFact(number: item.number)
                    .publish()
                    .map(NumberFactServiceAction.factGenerated)
                    .catchToEffect(InteractiveListAction.numberFactService)
            case .numberFactService(.success(.factGenerated(let fact))):
                state.title = fact
            case .numberFactService(.failure):
                state.alert = AlertState(
                    title: TextState("Ave!"),
                    message: TextState("Honda is the best car ever!"),
                    buttons: [
                        .cancel(TextState("Cancel")),
                    ]
                )
            case .buttonPressed:
                state.reloadableCellState.id = Int(state.targetArraySizeString) ?? 0
                return .send(.reloadableCell(.load))
            case .switchToggle(let enabled):
                state.toggle = enabled
            case .alertDismissed:
                state.alert = nil
            default:
                break
            }
            return .none
        }
        .forEach(\.items, action: /InteractiveListAction.item) {
            CellReducer()
        }
    }
}
