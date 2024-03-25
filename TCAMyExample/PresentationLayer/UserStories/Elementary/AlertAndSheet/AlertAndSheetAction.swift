//
//  AlertAndSheetAction.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 26.02.2024.
//

import Foundation

// MARK: - AlertAndSheetAction

/// All available `AlertAndSheet` module actions.
///
/// It's a type that represents all of the actions that can happen in `AlertAndSheet` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum AlertAndSheetAction: Equatable {

    // MARK: - Cases
    
    /// An action that calls when user taps on the button that activates sheet
    case actionSheetButtonTapped
    
    /// An action that calls when user taps on the `cancel` button on the sheet
    case actionSheetCancelTapped
    
    /// An action that calls when user taps on the `dismiss` button on the sheet
    case actionSheetDismissed

    /// An action that calls when user taps on the button that activates alert
    case alertButtonTapped
    
    /// An action that calls when user taps on the `cancel` button on the alert
    case alertCancelTapped
    
    /// An action that calls when user taps on the `dismiss` button on the alert
    case alertDismissed

    /// Increments `count` value in state
    case incrementButtonTapped
    
    /// Decrements `count` value in state
    case decrementButtonTapped
}
