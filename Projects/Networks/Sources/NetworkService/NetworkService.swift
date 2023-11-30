//
//  NetworkService.swift
//  Networks
//
//  Created by 임현규 on 11/30/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import Apollo
import GraphQLAPI

public final class NetworkService {
    private(set) var apollo = AuthApolloClient.apolloClientWithIntercepter
    
    var product: ProductQuery.Data.Product?
    
    public init() { }
    
    public func fetchProductList() {
        let query = ProductQuery(hash: "73BC8649785CC47660AE5DC3B802CDA6")
        apollo.fetch(query: query) { result in
            switch result {
            case .success(let value):
                self.product = value.data?.product
                if let data = value.data {
                    print(dump(data.product))
                    print("데이터 들어옴")
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
