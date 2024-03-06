//
//  NumberFactService.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ServiceCore

// MARK: - Aliases

public typealias NumberFactServiceError = NSError

// MARK: - Services

public enum NumberFactServiceAction: Equatable {
    
    // MARK: - Cases
    
    case factGenerated(String)
}

// MARK: - NumberFactService

public protocol NumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFact(number: Int) -> ServiceCall<String>
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFactt(number: Int) -> ServiceCall<String>
}

public enum MockNumberFactServiceAction: Equatable {
    
    case mockFactGenerated(String)
}

// MARK: - MockNumberFactService

public protocol MockNumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFact(number: Int) -> ServiceCall<String>
}

