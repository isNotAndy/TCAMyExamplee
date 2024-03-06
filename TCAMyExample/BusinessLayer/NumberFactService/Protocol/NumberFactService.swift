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

// MARK: - NumberFactServiceAction

public enum NumberFactServiceAction: Equatable {
    
    // MARK: - Cases
    
    case factObtained(String)
    case numberInfoObtained([NumberInfoPlainObject])
}

// MARK: - NumberFactService

public protocol NumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func obtainFact(number: Int) -> ServiceCall<String>
    
    /// Obtain Array of CellNumberPlainObject
    /// - Returns: Array of CellNumberPlainObject
    func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]>
    
    func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> 
}
