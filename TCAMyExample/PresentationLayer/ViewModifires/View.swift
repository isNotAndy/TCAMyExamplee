//
//  Frame.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 19.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View+Frame

extension View {
    
    /// An extension to simplify setting both width and height of a view to create a square frame.
    ///
    /// - Parameters:
    ///   - size: The size to be applied to both width and height of the view.
    /// - Returns: A view with equal width and height based on the provided size.
    public func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}

// MARK: - View+Pin

extension View {
    
    public func pin(placement: Placement) -> some View {
        modifier(Pin(placement: placement))
    }
}

// MARK: - Pin

public struct Pin: ViewModifier {
    
    // MARK: - Properties
    
    /// The placement type for pinning the content.
    public let placement: Placement
    
    // MARK: - ViewModifier
    
    /// Modifies the view to pin its content based on the specified placement.
    ///
    /// - Parameter content: The content to be pinned.
    /// - Returns: A view modified to pin its content.
    public func body(content: Content) -> some View {
        switch placement {
        case .horizontal(let aligment):
            switch aligment {
            case .leading:
                HStack(spacing: 0) {
                    content
                    Spacer(minLength: 0)
                }
            case .trailing:
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    content
                }
            case .center:
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    content
                    Spacer(minLength: 0)
                }
            }
        case .top(let aligment):
            VStack(spacing: 0) {
                content
                    .pin(placement: .horizontal(aligment))
                Spacer(minLength: 0)
            }
        case .bottom(let aligment):
            VStack(spacing: 0) {
                Spacer(minLength: 0)
                content
                    .pin(placement: .horizontal(aligment))
            }
        }
    }
}

/// Specifies different types of placement for pinning content.
public enum Placement {
    case horizontal(Horizontal)
    case top(Horizontal)
    case bottom(Horizontal)
}

/// Specifies different horizontal alignments for content pinning.
public enum Horizontal {
    case leading
    case trailing
    case center
}

extension Button {
    public func plain() -> some View {
        self.buttonStyle(PlainButtonStyle())
    }
}
