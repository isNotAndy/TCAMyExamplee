//
//  DoubleCountersActon.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ComposableArchitecture

/// All available `DoubleCounterAction` module actions.
///
/// It's a type that represents all of the actions that can happen in `DoubleCounterAction` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum DoubleCounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Child action for `CounterAction` module.
    ///
    /// It's necessary as we use `pullback` operator in current module's reducer.
    /// In short, the `counter1` case means that every action in `CounterAction` module
    /// will be sent to current module through it
    case counter1(CounterAction)
    
    /// Child action for `CounterAction` module.
    ///
    /// It's necessary as we use `pullback` operator in current module's reducer.
    /// In short, the `counter2` case means that every action in `CounterAction` module
    /// will be sent to current module through it
    case counter2(CounterAction)
}
