//
//  TryWithViewStore.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 18.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CounterView

struct CounterView: View {
    // MARK: -  Store
    let store: StoreOf<Counter>
    
    // MARK: -  View
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HStack(spacing: 4) {
                Button {
                    viewStore.send(.substruct)
                } label: {
                    Image(systemName: "minus")
                }
                
                Text("\(viewStore.counterValue)")
                    .monospacedDigit()
                
                Button {
                    viewStore.send(.add)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

// MARK: - CounterDemoView

public struct CounterDemoView: View {
    // MARK: -  Store
  @State var store = Store(initialState: Counter.State()) {
    Counter()
  }

    // MARK: -  View
    public var body: some View {
    Form {
      Section {
        CounterView(store: store)
          .frame(maxWidth: .greatestFiniteMagnitude)
      }
    }
    .buttonStyle(.borderless)
    .navigationTitle("Counter demo")
  }
}

#Preview {
    CounterDemoView()
}
