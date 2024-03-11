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
    case numberInfoCacheObtained([NumberInfoPlainObject]?)
}

// MARK: - NumberFactService

public protocol NumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func obtainFact(number: Int) -> ServiceCall<String>
    
    /// Obtain Array of CellNumberPlainObject
    /// - Returns: Array of NumberInfoPlainObject
    func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]>
    
    /// Obtain Array of CellNumberPlainObject
    /// - Returns: Array of NumberInfoPlainObject
    func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]>
    
    /// Obtains a list of cached number information entries
    /// - Returns: Array of NumberInfoPlainObject
    func readNumberInfo() -> ServiceCall<[NumberInfoPlainObject]?>
    
    /// Removes a number information entry with the specified ID from the data store
    func removeNumber(with id: NumberInfoPlainObject.ID)
}

