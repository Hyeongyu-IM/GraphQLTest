//
//  ProductProviderType.swift
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

public protocol ProductProviderInterface {
    func fetchProduct(hash: String) -> Publishers.ApolloFetch<ProductQuery>
    func fetchProductList(hash: String) -> Publishers.ApolloFetch<ProductsQuery>
}
