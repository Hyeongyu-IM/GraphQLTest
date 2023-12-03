//
//  ProductQuery+QueryType.swift
//  Networks
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import GraphQLAPI
import GraphQLAPIMock
import ApolloTestSupport

extension ProductQuery: QueryType {
    public var sampleData: ProductQuery.Data.Product {
        let data: [String: Any] = [
            "product": [
                "__typename": "Product",
                "hash": "73BC8649785CC47660AE5DC3B802CDA6",
                "brand": "|베베원|",
                "name": "무형광 순면 사계절 배냇슈트-신생아",
                "sellPrc": 62200,
                "normalPrc": 108700,
                "discountRate": 42,
                "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202304/06/2037e70a2f00c03ee39925ace336baa5.jpg",
                "reviewAvg": 0,
                "reviewCount": 0,
                "tags": [],
                "soldOut": false
            ]
        ]
        
        let mockTestData = try! ProductQuery.Data(data: data,
                                                  variables: ["hash": "1234567890"])
        return mockTestData.product
    }
}

