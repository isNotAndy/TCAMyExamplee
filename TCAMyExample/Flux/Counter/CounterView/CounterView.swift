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
    let store: StoreOf<Counter>
    
    var body: some View {
        // WithViewStore - обычная суи вьюха
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
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
  @State var store = Store(initialState: Counter.State()) {
    Counter()
  }

    public var body: some View {
    Form {
      Section {
        CounterView(store: self.store)
          .frame(maxWidth: .infinity)
      }
    }
    .buttonStyle(.borderless)
    .navigationTitle("Counter demo")
  }
}

#Preview {
    CounterDemoView()
}
