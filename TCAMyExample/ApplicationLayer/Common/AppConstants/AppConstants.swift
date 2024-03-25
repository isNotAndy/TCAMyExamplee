//
//  AppConstants.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 23.03.2024.
//

import Foundation

// MARK: - Constants

public enum AppConstants {
    
    // MARK: - Pagination
    
    public enum Pagination {
        static let pageSize = 30
    }
    
    // MARK: - Network
    
    public enum Network {
        static let apiURL = URL(string: "http://numbersapi.com").unsafelyUnwrapped
    }
}
