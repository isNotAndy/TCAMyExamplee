//
//  SimpleOptionalState.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 23.02.2024.
//

import Foundation
import ComposableArchitecture
// MARK: - SimpleOptionalState

/// `SimpleOptional` module state
///
/// Basically, `SimpleOptionalState` is a type that describes the data
/// `SimpleOptional` feature needs to perform its logic and render its UI.
public struct SimpleOptionalState: Equatable {
    
    // MARK: - Properties
    
    /// Auxillary property for counter state description
    public var counterDescription: String {
        "BindingView is " + (counter == nil ? "nil" : "non-nil")
    }
    
    // MARK: - Children
    
    /// Optional CounterState instance
    public var counter: SimpleBindingState?
}
