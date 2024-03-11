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

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter session: URLSession instance
    public init(transport: HTTPTransport) {
        super.init(baseURL: Constants.Network.apiURL, transport: transport)
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {
    
    public func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            /// Generating an error with a 30 percent chance
            Double.random(in: 0...1) > 0.3
                ? .success(.random())
                : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    public func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            /// Generating an error with a 30 percent chance
            Double.random(in: 0...1) > 0.3
                ? .success(.generateCount(count: count))
                : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    public func obtainFact(number: Int) -> ServiceCall<String> {
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
