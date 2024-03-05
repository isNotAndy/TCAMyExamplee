//
//  CellView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - InteractiveListItemView

/// A visual representation of `Cell` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<CellState, CellAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct CellView: View {
    
    // MARK: - Properties
    
    /// The store powering the `Cell` reducer
    public let store: StoreOf<CellReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Circle()
                    .fill(Color(viewStore.color))
                    .frame(width: 20, height: 20)
                Text("\(viewStore.number)")
                Text(viewStore.title)
                Spacer(minLength: 4)
                Image(systemName: viewStore.image)
                    .renderingMode(.original)
                Button(action: {
                    viewStore.send(.checkBoxToggle)
                    let impact = UISelectionFeedbackGenerator()
                    impact.selectionChanged()
                }
                ) {
                    Image(
                        systemName: viewStore.isChecked
                        ? "checkmark.square"
                        : "square"
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
            .foregroundColor(viewStore.isChecked ? .gray : nil)
            .frame(height: 40)
            .onTapGesture {
                viewStore.send(.itemTapped)
            }
        }
    }
}