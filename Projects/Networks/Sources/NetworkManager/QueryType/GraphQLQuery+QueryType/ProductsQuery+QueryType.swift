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
        let mockMeta = Mock<CursorMetaDto>.init(isFinal: true, limit: 20, offset: 0)
        let mockProducts = [
            Mock<Product>.init(brand: "|베베원|",
                               discountRate: 42,
                               hash: "73BC8649785CC47660AE5DC3B802CDA6",
                               imgUrl: "https://static.shop.mmtalk.kr/_data/product/202304/06/2037e70a2f00c03ee39925ace336baa5.jpg",
                               name: "무형광 순면 사계절 배냇슈트-신생아",
                               normalPrc: 108700.0,
                               reviewAvg: 0.0,
                               reviewCount: 0,
                               sellPrc: 62200.0,
                               soldOut: false,
                               tags: []),
            Mock<Product>.init(brand: "[마미누리]",
                               discountRate: 10,
                               hash: "8A4053DFAC1F6922A81AED8ECAAD4792",
                               imgUrl: "https://static.shop.mmtalk.kr/_data/product/202311/27/a294758f4fe30941d565ab9b24e21e44.jpg",
                               name: "빅사이즈 임산부원피스 긴팔 홈웨어 임부복원피스 임부원피스 임신복 임산부의류 8959",
                               normalPrc: 52000,
                               reviewAvg: 0.0,
                               reviewCount: 0,
                               sellPrc: 46500,
                               soldOut: false,
                               tags: [])
        ]
        let mock = Mock<ProductList>.init(meta: mockMeta, products: mockProducts)
        return ProductsQuery.Data.from(mock).products
    }
    
}

