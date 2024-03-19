//
//  AlertAndSheetState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 26.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - AlertAndSheetState

/// `AlertAndSheet` module state
///
/// Basically, `AlertAndSheetState` is a type that describes the data
/// `AlertAndSheet` feature needs to perform its logic and render its UI.
public struct AlertAndSheetState: Equatable {

    // MARK: - Properties

    /// Currently displaying action sheet
    public var actionSheet: ConfirmationDialogState<AlertAndSheetAction>?

    /// Currently displaying alert
    public var alert: AlertState<AlertAndSheetAction>?

    /// Current testing value
    public var count = 0
}
