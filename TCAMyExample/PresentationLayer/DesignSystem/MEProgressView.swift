//
//  MEProgressView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.03.2024.
//

import Foundation
import SwiftUI
import TCANetworkReducers
import ComposableArchitecture

// MARK: - MEProgressView

public struct MEProgressView<Element: Equatable & Codable, ErrorType: Error & Equatable>: View  {
    
    // MARK: - Properties
    
    public var store: Store<PaginationState<Element>, PaginationAction<Element, ErrorType>>

    // MARK: - View
    
    public var body: some View {
        PaginationView(store: store) {
            ProgressView()
                .frame(width: 24, height: 24 , alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}
