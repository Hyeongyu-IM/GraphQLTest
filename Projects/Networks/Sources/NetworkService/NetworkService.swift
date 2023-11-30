//
//  NetworkService.swift
//  Networks
//
//  Created by 임현규 on 11/30/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import Core

import Apollo
import GraphQLAPI

public final class NetworkService {
    private(set) lazy var client: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let baseURL: URL = URL(string: .graphQLURLString)!
        
        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: baseURL
        )
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    public init() { }
    
    var product: ProductQuery.Data.Product?
    
    public func fetchProductList() {
        let query = ProductQuery(hash: "73BC8649785CC47660AE5DC3B802CDA6")
        client.fetch(query: query) { result in
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
