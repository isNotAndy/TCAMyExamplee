//
//  CounterAction .swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 22.02.2024.
//

import Foundation

/// All available `CounterAction` module actions.
///
/// It's a type that represents all of the actions that can happen in `CounterAction` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum CounterAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that calls when `Decrement` button tapped
    case decrementButtonTapped
    
    /// An action that calls when `Increment` button tapped
    case incrementButtonTapped
}
