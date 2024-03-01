//
//  NumberFactService.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import ServiceCore

public enum NumberFactServiceAction: Equatable {
    
    case factGenerated(String)
}
// MARK: - NumberFactService

public protocol NumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFact(number: Int) -> ServiceCall<String>
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFactt(number: String) -> ServiceCall<String>
}
