//
//  CellNumberPlainObjectService.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 05.03.2024.
//

import ServiceCore
import HTTPTransport
import Foundation

// MARK: - Aliases

public typealias CellNumberFactServiceError = NSError

// MARK: - CellNumberFactService

public enum CellNumberFactServiceAction: Equatable {
    
    case arrayOfCellFactGenerated([CellNumberPlainObject])
}

public protocol CellNumberFactService {
    
    /// Obtain Array of CellNumberPlainObject
    /// - Returns: Array of CellNumberPlainObject
    func generateArrayOfCellNumberFact() -> ServiceCall<[CellNumberPlainObject]>
}
