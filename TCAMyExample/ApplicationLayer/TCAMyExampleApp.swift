//
//  TCAMyExampleApp.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - TCAMyExampleApp

@main
public struct TCAMyExampleApp: App {
    
    // MARK: - Initializers
    
    public init() {
        TCAMyExampleAssembliesCollector.collect()
    }
    
    // MARK: - App
    
    public var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
