//
//  ProductsTransform.swift
//  Data
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

import Domain
import GraphQLAPI
import Networks

extension ProductsQuery.Data.Products {
    public func toDomain() -> ProductListModel {
        return ProductListModel(meta: meta.toDomain(),
                                products: products.map { $0.toDomain() })
    }
}

extension ProductsQuery.Data.Products.Meta {
    public func toDomain() -> MetaModel {
        return MetaModel(offset: offset,
                         limit: limit,
                         isFinal: isFinal)
    }
}

extension ProductsQuery.Data.Products.Product {
    public func toDomain() -> ProductModel {
        return ProductModel(hash: hash,
                            brand: brand,
                            name: name,
                            sellPrc: sellPrc,
                            normalPrc: normalPrc,
                            discountRate: discountRate,
                            imgUrl: imgUrl,
                            reviewAvg: reviewAvg,
                            reviewCount: reviewCount,
                            tags: tags,
                            soldOut: soldOut)
    }
}
