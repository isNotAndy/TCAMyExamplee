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
import SDAO
import TCANetworkReducers

// MARK: - NumberFactServiceMock

public final class NumberFactServiceMock: WebService {
    
    // MARK: - Property
    
    /// NumberInfoDAO instnce
    private let dao: NumberInfoDAO
    
    // MARK: - Initializers

    /// Default initializer
    init(dao: NumberInfoDAO) {
        self.dao = dao
        super.init(baseURL: Constants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - NumberFactService

extension NumberFactServiceMock: NumberFactService {
    
    /// Function to perform pagination
    public func pagination(pageNumber: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<NumberInfoPlainObject>> {
        createCall {
            
            let pageData: [NumberInfoPlainObject] = .random(count: pageSize)
            let paginationMetadata = PaginationMetadataPlainObject(
                totalObjectCount: 999_999,
                pageCount: 999_999,
                currentPage: pageNumber,
                perPage: pageSize
            )
            return .success(PaginatedResponsePlainObject(
                pagination: paginationMetadata,
                array: pageData
            ))
        }
    }
    
    
    /// Removes a number information entry with the specified ID from the data store
    public func removeNumber(with id:  NumberInfoPlainObject.ID) {
        try! dao.erase(byPrimaryKey: UniqueID(rawValue: id))
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
    
    /// Obtains a list of number information entries for the specified count
    public func obtainNumbersInfo(count: Int) -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            return .failure(NSError(domain: "incetro.error", code: 404, userInfo: nil))
        }
    }
    
    /// Obtains a list of number information entries
    public func obtainNumberInfo() -> ServiceCall<[NumberInfoPlainObject]> {
        createCall {
            return .failure(NSError(domain: "incetro.error", code: 404, userInfo: nil))
        }
    }
    
    /// Obtains a fact related to the specified number
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
