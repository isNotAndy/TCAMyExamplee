//
//  InteractiveListReducer.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 29.02.2024.
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
    /// `@Swinjectable` numberFactService: NumberFactService
    @Swinjectable var numberFactService: NumberFactService
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListState, InteractiveListAction> {
        BindingReducer()
        Scope(
            state: \.pagination,
            action: /InteractiveListAction.pagination
        ) {
            PaginationReducer { pageNumber, pageSize  in
                numberFactService
                    .obtainInfo(page: pageNumber, pageSize: pageSize)
                    .publish()
                    .delay(for: 1.5, scheduler: DispatchQueue.main.eraseToAnyScheduler())
                    .eraseToAnyPublisher()
            }
        }
        Reduce { state, action in
            switch action {
            case .pagination(.response(.success(let data))):
                state.items += IdentifiedArray(
                    uniqueElements: data.array.map(InteractiveListItemState.init)
                )
            case .addRandomTapped:
                state.items.insert(InteractiveListItemState(plain: .random()), at: 0)
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
            case .deleteItemTapped(let offsets):
                for offset in offsets {
                    let removedElement = state.items.remove(at: offset)
                    numberFactService.removeNumber(with: removedElement.id)
                }
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
                    .map(NumberFactServiceAction.factObtained)
                    .catchToEffect(InteractiveListAction.numberFactService)
            case .numberFactService(.success(.factObtained(let fact))):
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
                state.reloadableNumbersInfo.id = Int(state.targetArraySizeString) ?? 0
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
            InteractiveListItemReducer()
        }
    }
}
