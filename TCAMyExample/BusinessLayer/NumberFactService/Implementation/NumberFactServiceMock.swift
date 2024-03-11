//
//  File.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 06.03.2024.
//

import Foundation
import HTTPTransport
import Alamofire
import ServiceCore

// MARK: - NumberFactServiceMock

public final class NumberFactServiceMock: WebService {
    
    // MARK: - Initializers

    /// Default initializer
    public init() {
        super.init(baseURL: Constants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - NumberFactService

extension NumberFactServiceMock: NumberFactService {
    
    public func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            return .failure(NSError(domain: "incetro.error", code: 404, userInfo: nil))
        }
    }
    
    public func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            return .failure(NSError(domain: "incetro.error", code: 404, userInfo: nil))
        }
    }
    
    public func obtainFact(number: Int) -> ServiceCall<String> {
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
