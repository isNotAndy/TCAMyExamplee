//
//  File.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 06.03.2024.
//

import Foundation
import HTTPTransport
import Alamofire
import ServiceCore
import SDAO
import TCANetworkReducers

// MARK: - NumberFactServiceMock

public final class NumberFactServiceMock: WebService {
    
    // MARK: - Property
    
    /// NumberInfoDAO instnce
    private let dao: NumberInfoDAO
    
    // MARK: - Initializers

    /// Default initializer
    public init(dao: NumberInfoDAO) {
        self.dao = dao
        super.init(baseURL: Constants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - NumberFactService

extension NumberFactServiceMock: NumberFactService {
    
    public func obtainInfo(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<NumberInfoPlainObject>> {
        createCall {
            let pageData: [NumberInfoPlainObject] = .random(count: pageSize)
            let paginationMetadata = PaginationMetadataPlainObject(
                totalObjectCount: 999_999,
                pageCount: 999_999,
                currentPage: page,
                perPage: pageSize
            )
            return .success(PaginatedResponsePlainObject(
                pagination: paginationMetadata,
                array: pageData
            ))
        }
    }
    
    public func removeNumber(with id:  NumberInfoPlainObject.ID) {
        try! dao.erase(byPrimaryKey: UniqueID(rawValue: id))
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
