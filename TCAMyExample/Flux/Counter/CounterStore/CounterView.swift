//
//  TryWithViewStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import OldTCA

// MARK: - CounterView

public struct CounterView: View {
    
    /// The store powering the `Counter` feature
    public let store: StoreOf<CounterFeature>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 4) {
                Button {
                    viewStore.send(.decremetnButtonTapped)
                } label: {
                    Image(systemName: "minus")
                }
                
                Text("\(viewStore.count)")
                    .monospacedDigit()
                
                Button {
                    viewStore.send(.incrementsButtonTapped)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    CounterView(store: .init(initialState: CounterState(), 
                             reducer: CounterFeature()))
}
