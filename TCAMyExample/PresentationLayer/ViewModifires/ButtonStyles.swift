//
//  SquareFrame.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.03.2024.
//

import Foundation
import SwiftUI

// MARK: - Button

extension Button {
    
    /// Adds a plain() method to buttons that applies a PlainButtonStyle.
    public func plain() -> some View {
        self.buttonStyle(PlainButtonStyle())
    }
}
