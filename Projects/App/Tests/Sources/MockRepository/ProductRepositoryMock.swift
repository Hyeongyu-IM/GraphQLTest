//
//  ProductRepositoryMock.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/3/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Combine

import Core
import Domain
import Networks

import GraphQLAPI

public final class ProductRepositoryMock: ProductRepositoryInterface {
    private let needFail: Bool
    
    public init(needFail: Bool) {
        self.needFail = needFail
    }
    
    public func fetchProduct(hash: String) -> AnyPublisher<Domain.ProductModel, Error> {
        if needFail == true {
            return Fail<Domain.ProductModel, Error>(error: mmTalkError.networkError)
                .eraseToAnyPublisher()
        }
        let sampleData = ProductQuery.init(hash: hash).sampleData.toDomain()
        return Just(sampleData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    public func fetchProductList(listOption: GraphQLAPI.ProductListOptions) -> AnyPublisher<Domain.ProductListModel, Error> {
        if needFail == true {
            return Fail<Domain.ProductListModel, Error>(error: mmTalkError.networkError)
                .eraseToAnyPublisher()
        }
        let sampleData = ProductsQuery.init(listOptions: listOption).sampleData.toDomain()
        return Just(sampleData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
