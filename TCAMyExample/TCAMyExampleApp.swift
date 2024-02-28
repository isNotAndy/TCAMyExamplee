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
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HolderOfCountersView(store: Store(initialState: HolderOfCountersState(), reducer: HolderOfCountersReducer()))
            }
        }
    }
}
