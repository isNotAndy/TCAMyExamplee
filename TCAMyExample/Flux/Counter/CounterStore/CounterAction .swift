//
//  CounterAction .swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import OldTCA

public enum CounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Decrements given value
    case decremetnButtonTapped
    
    /// Increments given value
    case incrementsButtonTapped
}
