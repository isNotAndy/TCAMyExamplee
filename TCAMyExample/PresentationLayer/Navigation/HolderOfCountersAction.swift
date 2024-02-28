//
//  WrapperAction.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 28.02.2024.
//

import ComposableArchitecture

// MARK: - HolderOfCountersAction

public enum HolderOfCountersAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that calls when `Counter` button tapped
    case counterButtonTapped
    
    /// An action that calls when `DoubleCounter` button tapped
    case doubleCounterButtonTapped
    
    // MARK: - Children
    
    /// Child action for `Counter` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `counter` case means that every action in `counter` module
    /// will be sent to current module through it
    case counter(PresentationAction<CounterAction>)
    
    /// Child action for `DoubleCounter` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `doubleCounter` case means that every action in `doubleCounter` module
    /// will be sent to current module through it
    case doubleCounter(PresentationAction<DoubleCounterAction>)
    
    // MARK: - Binding
    
    /// Binding interlayer action
    ///
    /// Embeds a binding action in this action type.
    /// An action type that exposes a `binding` case that holds a `BindingAction`
    ///
    /// Used in conjunction with `BindableState` to safely eliminate the boilerplate typically
    /// associated with mutating multiple fields in state.
    ///
    /// See the documentation for `BindableState` for more details.
//    case binding(BindingAction<HolderOfCountersState>)
}
