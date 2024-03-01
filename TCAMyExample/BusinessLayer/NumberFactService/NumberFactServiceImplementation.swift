//
//  NumberFactServiceImplementation.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 22.02.2024.
//

import Foundation
import HTTPTransport
import Alamofire
import ServiceCore

// MARK: - NumberFactServiceImplementation

public final class NumberFactServiceImplementation: WebService {

    // MARK: - Properties

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter session: URLSession instance
    public init(transport: HTTPTransport) {
        super.init(baseURL: Constants.Network.apiURL, transport: transport)
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {
    
    public func generateFact(number: Int) -> ServiceCall<String> {
        createCall {
            let request = HTTPRequest(
                httpMethod: .get,
                endpoint: "\(number)/trivia",
                base: self.baseRequest
            )
            let result = self.transport.send(request: request)
            switch result {
            case .success(let response):
                return .success(String(decoding: response.body.unsafelyUnwrapped, as: UTF8.self))
            case .failure(let nsError):
                return .failure(nsError)
            }
        }
    }
}
