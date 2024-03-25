//
//  SimpleBindingState.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.02.2024.
//

import SwiftUI

// MARK: - SimpleBindingState

/// `SimpleBindings` module state
///
/// Basically, `SimpleBindingsState` is a type that describes the data
/// `SimpleBindings` feature needs to perform its logic and render its UI.
public struct SimpleBindingState: Equatable {
    
    // MARK: - PickableColor
    
    /// Tint color variants
    public enum PickableColor:String, CaseIterable {
        
        // MARK: - Cases
        
        case red
        case green
        case blue
        case orange
        case purple
        
        // MARK: - Properties
        
        public var color: Color {
            switch self {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .orange:
                return .orange
            case .purple:
                return .purple
            }
        }
    }
    
    // MARK: - Properties
    
    /// Tint color variants
    public let colors = PickableColor.allCases

    /// Current tint color for all controls
    public var pickedColor = PickableColor.red

    /// Currently inputed text
    public var text = ""

    /// True if controls can be touched
    public var toggleEnabled = false

    /// Current slider value
    public var sliderValue = 0.0

    /// Max slider value
    public var counter = CounterState(count: 20)
}
