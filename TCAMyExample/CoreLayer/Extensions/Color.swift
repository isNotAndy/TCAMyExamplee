//
//  Color.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 12.03.2024.
//

import Foundation
import SwiftUI

// MARK: - Color

extension Color {
    
    /// Creates an instance of `Color` from a string representation of a hex value.
    /// - Parameter hex: String representation of the hex value of a color (e.g., "FF0000" for red).
    /// May contain the "#" symbol at the beginning, which will be removed before processing.
    public init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}
