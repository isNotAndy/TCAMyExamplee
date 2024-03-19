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
import TCANetworkReducers

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
    
    public func obtainInfo(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<NumberInfoPlainObject>> {
        createCall {
            let pageData: [NumberInfoPlainObject] = .random(count: pageSize)
            let paginationMetadata = PaginationMetadataPlainObject(
                totalObjectCount: Int.max,
                pageCount: Int.max / pageSize,
                currentPage: page,
                perPage: pageSize
            )
            return .success(PaginatedResponsePlainObject(
                pagination: paginationMetadata,
                array: pageData
            ))
        }
    }
    
    public func removeNumber(with id: NumberInfoPlainObject.ID) {
        try? dao.erase(byPrimaryKey: id)
    }
    
    public func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            let result: [NumberInfoPlainObject] = .random()
            let isSuccess = Double.random(in: 0...1) > 0.3
            if isSuccess {
                try self.dao.persist(result)
            }
            return isSuccess
            ? .success(result)
            : .failure(NSError(domain: "Unowned error", code: 303))
        }
    }
    
    public func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            let result: [NumberInfoPlainObject] = .random(count: count)
            let isSuccess = Double.random(in: 0...1) > 0.3
            if isSuccess {
                try self.dao.persist(result)
            }
            return isSuccess
            ? .success(result)
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
