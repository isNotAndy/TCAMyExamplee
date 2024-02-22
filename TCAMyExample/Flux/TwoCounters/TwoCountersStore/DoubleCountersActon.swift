//
//  DoubleCountersActon.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import OldTCA

public enum DoubleCounterAction: Equatable {
    
    // MARK: - Cases
    
    case counter1(CounterAction)
    
    case counter2(CounterAction)
}
