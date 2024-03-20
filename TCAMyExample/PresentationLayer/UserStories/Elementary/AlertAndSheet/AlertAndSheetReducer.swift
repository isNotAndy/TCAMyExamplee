//
//  AlertAndSheetReducer.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 26.02.2024.
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
        case .actionSheetDismissed:
            state.actionSheet = nil
        case .alertButtonTapped:
            state.alert = AlertState(
                title: TextState("Alert!"),
                message: TextState("This is an alert"),
                buttons: [
                    .cancel(TextState("Cancel")),
                    .default(.init("Increment"), action: .send(.incrementButtonTapped))
                ]
            )
        case .alertDismissed:
            state.alert = nil
        case .decrementButtonTapped:
            state.alert = AlertState(title: TextState("Decremented 👇🏻"))
            state.count -= 1
        case .incrementButtonTapped:
            state.alert = AlertState(title: TextState("Incremented 👆🏻"))
            state.count += 1
        default:
            break
        }
        return .none
    }
}
