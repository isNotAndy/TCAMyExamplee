//
//  TCAMyExampleApp.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAMyExampleApp: App {
    
    init() {
        SomeAssembliesCollector.collect()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
