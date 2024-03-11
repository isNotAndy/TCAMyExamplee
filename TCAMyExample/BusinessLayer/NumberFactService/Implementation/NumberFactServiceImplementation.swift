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
import SDAO

// MARK: - NumberFactServiceImplementation

public final class NumberFactServiceImplementation: WebService {
    
    // MARK: - Property
    
    /// NumberInfoDAO instnce
    private let dao: NumberInfoDAO
    

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter session: URLSession instance
    init(transport: HTTPTransport, dao: NumberInfoDAO) {
        self.dao = dao
        super.init(baseURL: Constants.Network.apiURL, transport: transport)
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {
    
    /// Removes a number information entry with the specified ID from the data store
    public func removeNumber(with id: NumberInfoPlainObject.ID) {
        try? dao.erase(byPrimaryKey: id)
    }
    
    /// Obtains a list of number information entries
    public func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            let result: [NumberInfoPlainObject] = .random()
            let isSuccess = Double.random(in: 0...1) > 0.3
            if isSuccess {
                try self.dao.persist(result)
            }
            /// Generating an error with a 30 percent chance
            return isSuccess
            ? .success(result)
            : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    /// Obtains a list of number information entries for the specified count
    public func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            let result: [NumberInfoPlainObject] = .random(count: count)
            let isSuccess = Double.random(in: 0...1) > 0.3
            if isSuccess {
                try self.dao.persist(result)
            }
            /// Generating an error with a 30 percent chance
            return isSuccess
            ? .success(result)
            : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    /// Obtains a fact related to the specified number
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
    
    /// Obtains a list of cached number information entries
    public func readNumberInfo() -> ServiceCall<[NumberInfoPlainObject]?> {
        createCall {
            do {
                let result = try self.dao.read()
                return .success(result)
            } catch {
                return .failure(error)
            }
        }
    }
}
