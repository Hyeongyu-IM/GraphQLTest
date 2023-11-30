//
//  AuthorizationInterceptor.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import ThirdPartyLibs

import Apollo
import ApolloAPI

final class AuthorizationInterceptor: ApolloInterceptor {
    var id: String

    init(id: String = "AuthorizationInterceptor") {
        self.id = id
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            request.addHeader(name: "Authorization", value: "Bearer 2G8QgQ5RCM")
            
            chain.proceedAsync(request: request,
                               response: response,
                               interceptor: self,
                               completion: completion)
        }
}

