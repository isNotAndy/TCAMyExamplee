//
//  SimpleBindingView.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.02.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - SimpleBindingView

public struct SimpleBindingView: View {
    
    // MARK: - Properties

    /// The store powering the `SimpleBindings` feature
    public let store: StoreOf<SimpleBindingReducer>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            List {
                VStack {
                    Picker(
                        "",
                        selection: viewStore.binding(
                            get: \.pickedColor,
                            send: SimpleBindingAction.pickValue
                        )
                    ) {
                        ForEach(viewStore.colors, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0.color)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                TextField(
                    "Enter your text",
                    text: viewStore.binding(
                        get: \.text,
                        send: SimpleBindingAction.changeText
                    )
                )
                .disabled(viewStore.toggleEnabled)
                
                Toggle(isOn: viewStore.binding(
                    get: \.toggleEnabled,
                    send: SimpleBindingAction.switchToggle)
                ) {
                    Text("Disable other controls")
                }
                .toggleStyle(SwitchToggleStyle(tint: viewStore.pickedColor.color))
                
                HStack {
                    Text("This counter changes slider's max value")
                    Spacer(minLength: 0)
                    CounterView(
                        store: store.scope(
                            state: \.counter,
                            action: SimpleBindingAction.counter
                        )
                    )
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                }
                .disabled(viewStore.toggleEnabled)
                
                HStack {
                    Text("Slider value: \(Int(viewStore.sliderValue))")
                    Spacer(minLength: 0)
                    Slider(
                        value: viewStore.binding(
                            get: \.sliderValue,
                            send: SimpleBindingAction.moveSlider
                        ),
                        in: 0...Double(viewStore.counter.count),
                        step: 1
                    )
                    .disabled(viewStore.toggleEnabled)
                    .padding(4)
                }
                
                Button("Reset all controls") {
                    viewStore.send(.resetControls)
                }
            }
            .accentColor(viewStore.pickedColor.color)
        }
    }
}
