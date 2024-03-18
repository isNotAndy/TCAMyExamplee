//
//  DispatchQueue.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 13.03.2024.
//

import Foundation

// MARK: - DispatchQueue

extension DispatchQueue {

    private static var _onceTracker: [String] = []

    static func removeOnceToken(_ token: String) {
        _onceTracker.removeAll {
            $0 == token
        }
    }

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
