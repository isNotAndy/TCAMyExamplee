//
//  AlertAndSheetView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 26.02.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - AlertAndSheetView

public struct AlertAndSheetView: View {

    // MARK: - Properties

    /// The store powering the `AlertAndSheet` reducer
    public let store: StoreOf<AlertAndSheetReducer>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section {
                    Text("Count: \(viewStore.count)")
                    Button("Alert") {
                        viewStore.send(.alertButtonTapped)
                    }
                    Button("Sheet") {
                        viewStore.send(.actionSheetButtonTapped)
                    }
                }
                .textCase(nil)
            }
            .navigationTitle("Alert and ActionSheet")
            .alert(
                store.scope(state: \.alert),
                dismiss: .alertDismissed
            )
            .confirmationDialog(
                store.scope(state: \.actionSheet),
                dismiss: .actionSheetDismissed
            )
        }
    }
}
