//
//  InteractiveListState.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 29.02.2024.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers

// MARK: - InteractiveListState

/// `InteractiveList` module state
///
/// Basically, `InteractiveListState` is a type that describes the data
/// `InteractiveList` feature needs to perform its logic and render its UI.
public struct InteractiveListState: Equatable {
    
    // MARK: - Properties
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<CellState>`, where `CellState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
    
    /// title of element in `items`
    public var title: String = ""
    
    /// number of element in `items`
    public var number: Int = 0
    
    /// True if controls can be touched
    public var toggle = false
    
    /// Currently displaying alert
    public var alert: AlertState<InteractiveListAction>?
    
    /// ReloadableState instace for network operations
    public var reloadableNumbersInfo: IDReloadableState<[NumberInfoPlainObject], Int, NumberFactServiceError>
    
    /// Currently inputed text
    @BindingState public var targetArraySizeString = ""
    
    /// Pagination state instance
    public var pagination: PaginationState<NumberInfoPlainObject>
}

extension InteractiveListState {
    
    public init(defaultCount: Int) {
        reloadableNumbersInfo = IDReloadableState(id: defaultCount)
        pagination = PaginationState(pageSize: 30)
    }
}
