//
//  Int.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 05.03.2024.
//

import Foundation

// MARK: - Int

extension Int {
    
    /// Get random element in array
    public static func randomNumber() -> Int {
        
        /// Array
        [222, 111, 4, 38, 91, 14, 23, 37, 88, 11, 11, 671]
            .randomElement()
            .unsafelyUnwrapped
    }
}
