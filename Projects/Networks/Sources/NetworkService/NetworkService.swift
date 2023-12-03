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
}
