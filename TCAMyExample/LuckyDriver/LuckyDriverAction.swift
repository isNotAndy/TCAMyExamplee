//
//  LuckyDriverAction.swift
//  TheRun
//
//  Created by Gleb Kovalenko on 24.01.2024.
//  Copyright © 2024 Incetro Inc. All rights reserved.
//

import Foundation
import TCANetworkReducers
import ComposableArchitecture

// MARK: - LuckyDriverAction

public enum LuckyDriverAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// General action that calls when view appears
    case onAppear
    
    /// General action that calls when view disappears
    case onDisappear
    
    /// An action that calls when user taps on the `Start` button
    case startButtonTapped
    
    /// An action that calls when user taps on the `MyTransport` button
    case myTransportButtonTapped
    
    /// An action that calls when need to close explorer game
    case closeExplorerGame
    
    /// An action that calls when challenge end date obtained
    case challengeEndDateObtained(Double)
    
    /// An action that calls when user taps on the `dismiss` button on the alert
    case alertDismissed
    
    // MARK: - Children
    
    /// Child action for `Countdown` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `countdown` case means that every action in `Countdown` module
    /// will be sent to current module through it
    case countdown(TCACountdownAction)
    
    /// Child action for `ExplorerGame` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `explorerGame` case means that every action in `ExplorerGame` module
    /// will be sent to current module through it
    case explorerGame(ExplorerGameAction)
    
    // MARK: - Service
    
    /// Child action for `ExplorerService` business logic.
    ///
    /// It's necessary as we use `ExplorerService` instance in the current module's reducer
    /// and publish its events to current module's store.
    /// In short, the `explorer` case means that every action in `ExplorerService`
    /// will be sent to current module through it
    case explorerService(Result<ExplorerServiceAction, ExplorerServiceError>)
    
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
    case binding(BindingAction<LuckyDriverState>)
    
    // MARK: - Reloadable
    
    case reloadableLuckyDriver(ReloadableAction<ExplorerRatingPlainObject, ExplorerServiceError>)
}
