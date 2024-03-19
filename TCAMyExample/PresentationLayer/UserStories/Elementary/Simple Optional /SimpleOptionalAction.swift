//
//  SimpleOptionalAction.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.02.2024.
//

import Foundation

// MARK: - SimpleOptionalAction

/// All available `SimpleOptional` module actions.
///
/// It's a type that represents all of the actions that can happen in `SimpleOptional` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum SimpleOptionalAction: Equatable {
    
    // MARK: - Cases
    
    /// Toggles optional state
    case toggleOptional
    
    // MARK: - Children
    
    /// Child action for `Binding` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `Binding` case means that every action in `Binding` module
    /// will be sent to current module through it
    case binding(SimpleBindingAction)
}
