//
//  File.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 05.03.2024.
//

import Foundation
import HTTPTransport
import ServiceCore

// MARK: - CellNumberFactServiceImplementation

public final class CellNumberFactServiceImplementation: WebService {
    
    // MARK: - Initializers

    /// Default initializer
    public init() {
        super.init(baseURL: Constants.Network.apiURL, transport: HTTPTransport())
    }
}

extension CellNumberFactServiceImplementation: CellNumberFactService {
    
    public func generateArrayOfCellNumberFact() -> ServiceCall<[CellNumberPlainObject]> {
        createCall {
            
            /// generating an error with a 30 percent chance
            Double.random(in: 0...1) > 0.32
                ? .success(.randomizeItems())
                : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    public func generateArrayOfCellNumberFact(count: Int) -> ServiceCall<[CellNumberPlainObject]> {
        createCall {
            
            /// generating an error with a 30 percent chance
            Double.random(in: 0...1) > 0.3
            ? .success(.generateCount(count: count))
            : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
}
