//
//  MainView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    var body: some View {
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
            }
        }
    }
}

#Preview {
    MainView()
}