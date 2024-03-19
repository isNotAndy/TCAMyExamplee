//
//  MEPaginationView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.03.2024.
//

import Foundation
import SwiftUI
import TCANetworkReducers
import ComposableArchitecture

// MARK: - MEPaginationView

/// A visual representation of `MEPaginationView` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<PaginationState, PaginationAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct MEPaginationView<Element: Equatable & Codable, ErrorType: Error & Equatable>: View  {
    
    // MARK: - Properties
    
    public var store: Store<PaginationState<Element>, PaginationAction<Element, ErrorType>>

    // MARK: - PaginationView
    
    public var body: some View {
        PaginationView(store: store) {
            HStack(spacing: 0) {
              Spacer()
                 ProgressView()
                   .frame(width: 24, height: 24, alignment: .center)
              Spacer()
            }
             .background(Color.red)
        }
    }
}
