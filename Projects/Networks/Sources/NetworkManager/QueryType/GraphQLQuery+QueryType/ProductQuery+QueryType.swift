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
        let mock = Mock<Product>.init(brand: "|베베원|",
                                      discountRate: 42,
                                      hash: "73BC8649785CC47660AE5DC3B802CDA6",
                                      imgUrl: "https://static.shop.mmtalk.kr/_data/product/202304/06/2037e70a2f00c03ee39925ace336baa5.jpg",
                                      name: "무형광 순면 사계절 배냇슈트-신생아",
                                      normalPrc: 108700.0,
                                      reviewAvg: 0.0,
                                      reviewCount: 0,
                                      sellPrc: 62200.0,
                                      soldOut: false,
                                      tags: [])
        
        return ProductQuery.Data.from(mock).product
    }
}

