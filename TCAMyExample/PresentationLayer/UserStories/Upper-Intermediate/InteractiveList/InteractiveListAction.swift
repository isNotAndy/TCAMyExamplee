//
//  InteractiveListAction.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 29.02.2024.
//

import Foundation
import TCANetworkReducers
import ComposableArchitecture

// MARK: - InteractiveListAction

/// All available `InteractiveList` module actions.
///
/// It's a type that represents all of the actions that can happen in `InteractiveList` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the reducer. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum InteractiveListAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// Setter for `toggleEnabled` property binding
    case switchToggle(Bool)
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    /// An action that triggers the addition of a random item to the list.
    case addRandomTapped
    
    /// An action that triggers the removal of all checked items from the list.
    case removeCheckedItems
    
    /// An action that triggers the deletion of one or more items from the list.
    /// The `IndexSet` parameter specifies the indices of the items to be deleted.
    case deleteItemTapped(IndexSet)
    
    // MARK: - Children
    
    /// An action that triggers a specific action on a single item in the list.
    /// The `id` parameter specifies the unique identifier of the item,
    /// and the `action` parameter represents the specific action to be performed on the item.
    case item(id: InteractiveListItemState.ID, action: InteractiveListItemAction)
    
    // MARK: - Service
    
    /// Responce of the `NumberFactService` generation method
    case numberFactService(Result<NumberFactServiceAction, NSError>)
    
    /// An action that calls when user taps on the `dismiss` button on the alert
    case alertDismissed
    
    /// Button was pressed
    case buttonPressed
    
    // MARK: - Reloadable
    
    case reloadableCell(ReloadableAction<[NumberInfoPlainObject], NumberFactServiceError>)
    
    // MARK: - Binding
    
    case binding(BindingAction<InteractiveListState>)
    
    // MARK: - Pagination
    
    case pagination(PaginationAction<NumberInfoPlainObject, NumberFactServiceError>)
}
