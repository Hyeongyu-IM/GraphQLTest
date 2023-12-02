//
//  ProductRepository.swift
//  Data
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Combine

import Domain

import Networks
import GraphQLAPI

public final class ProductRepository {
    let productRepositoryProvider: ProductProviderInterface
    
    public init(productRepositoryProvider: ProductProviderInterface = ProductProvider()) {
        self.productRepositoryProvider = productRepositoryProvider
    }
}

extension ProductRepository: ProductRepositoryInterface {
    public func fetchProduct(hash: String) -> AnyPublisher<ProductModel, Error> {
        return productRepositoryProvider.fetchProduct(hash: hash)
            .compactMap { $0.data?.product.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func fetchProductList(listOption: ProductListOptions) -> AnyPublisher<ProductListModel, Error> {
        return productRepositoryProvider.fetchProductList(listOption: listOption)
            .compactMap { $0.data?.products.toDomain() }
            .eraseToAnyPublisher()
    }
}
