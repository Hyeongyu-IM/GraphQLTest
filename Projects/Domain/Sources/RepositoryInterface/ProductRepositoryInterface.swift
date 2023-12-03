//
//  ProductRepositoryInterface.swift
//  Domain
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import Combine
import GraphQLAPI

public protocol ProductRepositoryInterface: AnyObject {
    func fetchProduct(hash: String) -> AnyPublisher<ProductModel, Error>
    func fetchProductList(listOption: ProductListOptions) -> AnyPublisher<ProductListModel, Error>
}
