//
//  NetworkManager.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//
import Foundation
import Combine

import Apollo
import ApolloAPI
import GraphQLAPI

public final class ProductProvider: ProductProviderInterface {
    private let network: NetworkService = .init()
    
    public init() {}
    
    public func fetchProduct(hash: String) -> Publishers.ApolloFetch<ProductQuery> {
        return network.client.fetchPublisher(query: ProductQuery(hash: hash))
    }
    
    public func fetchProductList(listOption: ProductListOptions) -> Publishers.ApolloFetch<ProductsQuery> {
        return network.client.fetchPublisher(query: ProductsQuery(listOptions: listOption))
    }
}
