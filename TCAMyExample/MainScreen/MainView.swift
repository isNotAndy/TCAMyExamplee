//
//  MainView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 19.02.2024.
//

import SwiftUI
import OldTCA

// MARK: - MainView

public struct MainView: View {
    
    // MARK: - View
    
    public var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Easy Counter") {
                        CounterView(store: .init(initialState: CounterState(), 
                                                 reducer: CounterFeature()))
                    }
                    NavigationLink("Two Counters") {
                        DoubleCounterView(store: .init(initialState: DoubleCounterState(), 
                                                       reducer: DoubleCounterFeature()))
                    }
                }
                .navigationTitle("Two counters")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainView()
}
