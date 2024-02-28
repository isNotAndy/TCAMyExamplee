//
//  AlertAndSheetReducer.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 26.02.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - AlertAndSheetReducer

public struct AlertAndSheetReducer: Reducer {
    
    // MARK: - Reducer
    
    public func reduce(into state: inout AlertAndSheetState, action: AlertAndSheetAction) -> Effect<AlertAndSheetAction> {
        switch action {
        case .actionSheetButtonTapped:
            state.actionSheet = .init(
                title: TextState("Action sheet"),
                message: TextState("This is an action sheet."),
                buttons: [
                    .cancel(TextState("Cancel")),
                    .default(TextState("Increment"), action: .send(.incrementButtonTapped)),
                    .default(TextState("Decrement"), action: .send(.decrementButtonTapped)),
                ]
            )
            return .none
        case .actionSheetCancelTapped:
            return .none
        case .actionSheetDismissed:
            state.actionSheet = nil
            return .none
        case .alertButtonTapped:
            state.alert = AlertState(
                title: TextState("Alert!"),
                message: TextState("This is an alert"),
                buttons: [
                    .cancel(TextState("Cancel")),
                    .default(.init("Increment"), action: .send(.incrementButtonTapped))
                ]
            )
            return .none
        case .alertCancelTapped:
            return .none
        case .alertDismissed:
            state.alert = nil
            return .none
        case .decrementButtonTapped:
            state.alert = AlertState(title: TextState("Decremented 👇🏻"))
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.alert = AlertState(title: TextState("Incremented 👆🏻"))
            state.count += 1
            return .none
        }
    }
}
