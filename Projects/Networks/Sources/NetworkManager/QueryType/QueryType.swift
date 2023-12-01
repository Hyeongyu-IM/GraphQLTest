//
//  QueryType.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import GraphQLAPI
import GraphQLAPIMock
import ApolloTestSupport

public protocol QueryType: GraphQLQuery {
    associatedtype QueryDataType
    var sampleData: QueryDataType { get }
}
