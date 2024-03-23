//
//  File.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View+PinToEdgeModifier

extension View {
    
    public func pinToEdge(placement: PinToEdgeModifier.Placement) -> some View {
        modifier(PinToEdgeModifier(placement: placement))
    }
}

// MARK: - PinToEdgeModifier

public struct PinToEdgeModifier: ViewModifier {
    
    // MARK: - Enums
    
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
                    .pinToEdge(placement: .horizontal(aligment))
                Spacer(minLength: 0)
            }
        case .bottom(let aligment):
            VStack(spacing: 0) {
                Spacer(minLength: 0)
                content
                    .pinToEdge(placement: .horizontal(aligment))
            }
        }
    }
}
