//
//  TwoCountersView.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 20.02.2024.
//

import SwiftUI
import OldTCA

// MARK: - DoubleCounterView

public struct DoubleCounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `DoubleCounter` feature
    public let store: StoreOf<DoubleCounterFeature>
    
    // MARK: - View
    
    public var body: some View {
        Form {
            HStack(spacing: 4) {
                CounterView(
                    store: store.scope(
                        state: \.counter1,
                        action: DoubleCounterAction.counter1
                    )
                )
                .buttonStyle(BorderlessButtonStyle())
            }
            HStack(spacing: 4) {
                CounterView(
                    store: store.scope(
                        state: \.counter2,
                        action: DoubleCounterAction.counter2
                    )
                )
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding([.trailing], 8)
        .navigationBarTitle("Composition")
    }
}
    


// MARK: - Preview

#Preview {
    DoubleCounterView(store: .init(initialState: DoubleCounterState(), 
                                   reducer: DoubleCounterFeature()))
}
