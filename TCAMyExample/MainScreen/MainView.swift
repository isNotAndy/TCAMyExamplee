//
//  MainView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - MainView

public struct MainView: View {
    
    // MARK: -  View
    
    public var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Easy Counter") {
                        CounterDemoView()
                    }
                    NavigationLink("Two Counters") {
                        TwoCountersView()
                    }
                }
                .navigationTitle("Two counters")
            }
        }
    }
}

#Preview {
    MainView()
}
