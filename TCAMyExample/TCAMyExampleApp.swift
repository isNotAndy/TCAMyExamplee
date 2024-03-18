//
//  TCAMyExampleApp.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - TCAMyExampleApp

@main
struct TCAMyExampleApp: App {
    
    // MARK: - Initializers
    
    init() {
        TCAMyExampleAssembliesCollector.collect()
    }
    
    // MARK: - App
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
