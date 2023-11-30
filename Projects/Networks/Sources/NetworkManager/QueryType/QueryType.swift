//
//  QueryType.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import GraphQLAPI

public protocol QueryType {
    var sampleData: Data { get }
}

public extension QueryType {
    var sampleData: Data { Data() }
}
