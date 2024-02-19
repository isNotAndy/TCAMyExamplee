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
                        Demo(store: Store(initialState: CounterReducer.State()) { CounterReducer() }) { store in
                            ContentView(store: store)
                        }
                    }
                }
            }
        }
    }
}

struct Demo<State, Action, Content: View>: View {
  @SwiftUI.State var store: Store<State, Action>
  let content: (Store<State, Action>) -> Content

  init(
    store: Store<State, Action>,
    @ViewBuilder content: @escaping (Store<State, Action>) -> Content
  ) {
      self.store = store
      self.content = content
  }

    var body: some View {
        self.content(self.store)
    }
}

#Preview {
    MainView()
}
