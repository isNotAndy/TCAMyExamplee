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
    public func generateFactt(number: Int) -> ServiceCore.ServiceCall<String> {
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

// MARK: - NumberFactServiceImplementation

public final class MockNumberFactServiceImplementation: WebService {
    
    // MARK: - Initializers

    /// Default initializer
    public init() {
        super.init(baseURL: Constants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - MockNumberFactServiceImplementation

extension MockNumberFactServiceImplementation: MockNumberFactService {
    
    public func generateFact(number: Int) -> ServiceCall<String> {
        createCall {
            switch number {
            case 14:
                return .success("aaaa")
            default:
                return .failure(NSError(domain: "incetro.error", code: 512, userInfo: nil))
            }
        }
    }
}
