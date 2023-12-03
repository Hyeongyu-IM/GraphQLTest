//
//  ProductsQuery+QueryType.swift
//  Networks
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import GraphQLAPI
import GraphQLAPIMock
import ApolloTestSupport

extension ProductsQuery: QueryType {
    public var sampleData: ProductsQuery.Data.Products {
        
        let data: [String: Any] = [
            "products": [
                "__typename": "Products",
                "meta": [
                    "__typename": "CursorMetaDto",
                    "offset": 0,
                    "limit": 20,
                    "isFinal": false
                ],
                "products": [
                    [
                        "__typename": "Product",
                        "hash": "73BC8649785CC47660AE5DC3B802CDA6",
                        "brand": "|베베원|",
                        "name": "무형광 순면 사계절 배냇슈트-신생아",
                        "sellPrc": 67300,
                        "normalPrc": 117500,
                        "discountRate": 42,
                        "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202304/06/6e2a71a7b0423bbbe7c97de339082158.jpg",
                        "reviewAvg": 0,
                        "reviewCount": 0,
                        "tags": [],
                        "soldOut": false
                    ],
                    [
                        "__typename": "Product",
                        "hash": "8A4053DFAC1F6922A81AED8ECAAD4792",
                        "brand": "[마미누리]",
                        "name": "빅사이즈 임산부원피스 긴팔 홈웨어 임부복원피스 임부원피스 임신복 임산부의류 8959",
                        "sellPrc": 52500,
                        "normalPrc": 58700,
                        "discountRate": 10,
                        "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/27/a294758f4fe30941d565ab9b24e21e44.jpg",
                        "reviewAvg": 0,
                        "reviewCount": 0,
                        "tags": [],
                        "soldOut": false
                    ]
                ]
            ]
        ]
        
        
        let mockTestData = try! ProductsQuery.Data(data: data,
                                                   variables: [
                                                    "listOptions": [
                                                        "offset": 0,
                                                        "limit": 20
                                                    ]
                                                   ])
        return mockTestData.products
    }
}

