//
//  NumberFactServiceImplementation.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation

// MARK: - NumberFactServiceImplementation

public final class NumberFactServiceImplementation {

    // MARK: - Properties

    /// URLSession instance
    private let session: URLSession

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter session: URLSession instance
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {

    public func generateFact(number: Int) async throws -> String {
        let (data, _) = try await session.data(from: URL(string: "http://numbersapi.com/\(number)/trivia").unsafelyUnwrapped)
        sleep(3)
        return String(decoding: data, as: UTF8.self)
    }
}
