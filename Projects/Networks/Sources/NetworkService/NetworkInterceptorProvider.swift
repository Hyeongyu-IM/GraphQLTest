//
//  NetworkInterceptorProvider.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import Apollo
import ApolloAPI

struct NetworkInterceptorProvider: InterceptorProvider {

  // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
  // will be handed to different interceptors.
  private let store: ApolloStore
  private let client: URLSessionClient

  init(store: ApolloStore, client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
        MaxRetryInterceptor(),
        CacheReadInterceptor(store: self.store),
        AuthorizationInterceptor(),
        NetworkFetchInterceptor(client: self.client),
        ResponseCodeInterceptor(),
        JSONResponseParsingInterceptor(),
        AutomaticPersistedQueryInterceptor(),
        CacheWriteInterceptor(store: self.store),
        
    ]
  }
}

