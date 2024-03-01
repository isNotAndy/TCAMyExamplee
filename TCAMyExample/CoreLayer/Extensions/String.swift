//
//  String.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 29.02.2024.
//

import Foundation

// MARK: - String

extension String {
    
    private static func funnyString(preferredLength: Int) -> String {
        /// without 'y'
        let vowels = ["e","a","u","i","o"]
        /// without 'q'
        let consonants = ["b","c","d","f","g","h","j","k","l","m","n","p","r","s","t","v","w","x","z"]
        return (0..<preferredLength).map { index in
            index % 2 == 0
            ? consonants[Int(arc4random() % UInt32(consonants.count))]
            : vowels[Int(arc4random() % UInt32(vowels.count))]
        }.joined()
    }

    static var generatedName: String {
        funnyString(preferredLength: 8)
    }
}

// MARK: - String+Color

extension String {
    
    /// get random element in `colors`
    public static func randomColor() -> String {
        
        /// `hex` colors
        let colors = [
            "#033270",
            "#1368AA",
            "#4091C9",
            "#9DCEE2",
            "#FEDFD4",
            "#F29479",
            "#F26A4F",
            "#EF3C2D",
            "#CB1B16",
            "#65010C"
        ]
        return colors.randomElement().unsafelyUnwrapped
    }
}

// MARK: - String+Images

extension String {
    
    /// get random element in `images`
    public static func randomImage() -> String {
        
        /// array of `SF Symbol`
        let images = [
            "sun.max.fill",
            "heart.fill",
            "allergens",
            "hourglass"
        ]
        return images.randomElement().unsafelyUnwrapped
    }
}

extension String {
    
    /// get random element in `number`
    public static func randomNumber() -> String {
        
        /// array of `number`
        let numbers = [
        "1","17","4","38","91","14","23","37","88","11","98","67"
        ]
        return numbers.randomElement().unsafelyUnwrapped
    }
}
