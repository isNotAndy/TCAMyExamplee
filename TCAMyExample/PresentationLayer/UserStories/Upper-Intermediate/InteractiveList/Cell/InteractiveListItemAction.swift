//
//  InteractiveListItemAction.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation

// MARK: - CellAction

/// All available `InteractiveListItem` module actions.
///
/// It's a type that represents all of the actions that can happen in `InteractiveListItem` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum InteractiveListItemAction: Equatable {
    
    // MARK: - Cases
    
    /// Toggle `isChecked` state value
    case checkBoxToggle
    
    /// An action that calls when some item tapped
    case itemTapped
}
