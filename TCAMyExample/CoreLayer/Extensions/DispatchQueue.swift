//
//  DispatchQueue.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Foundation

// MARK: - DispatchQueue

extension DispatchQueue {

    /// Internal tracker to store tokens for code blocks that have been executed.
    private static var _onceTracker: [String] = []

    /// Removes the specified token from the internal tracker, allowing the associated code block to be executed again.
    /// - Parameter token: A unique identifier for the code block.
    static func removeOnceToken(_ token: String) {
        _onceTracker.removeAll {
            $0 == token
        }
    }

    /// Ensures that the provided block of code is executed only once throughout the application's lifecycle.
    /// - Parameters:
    /// - token: A unique identifier for the code block.
    /// - block: A closure containing the code that should be executed once.
    static func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}
