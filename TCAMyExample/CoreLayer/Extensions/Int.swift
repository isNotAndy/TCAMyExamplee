//
//  Int.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 05.03.2024.
//

import Foundation

// MARK: - Int

extension Int {
    
    /// get random element in `number`
    public static func randomNumber() -> Int {
        
        /// array of `number`
        let numbers = [
        222, 111, 4, 38, 91, 14, 23, 37, 88, 11, 11, 671
        ]
        return numbers.randomElement().unsafelyUnwrapped
    }
}
