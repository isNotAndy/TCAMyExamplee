//
//  NumberFactService.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation

// MARK: - NumberFactService

public protocol NumberFactService {
    
    /// Obtain some number's fact
    /// - Returns: number fact string
    func generateFact(number: Int) async throws -> String
}
