//
//  ProductListModel.swift
//  Domain
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

//MARK: Entity -- ProductsQuery
public struct ProductListModel {
    /// pagination meta 정보
    public var meta: MetaModel
    /// 상품 목록
    public var products: [ProductModel]
    
    public init(meta: MetaModel, products: [ProductModel]) {
        self.meta = meta
        self.products = products
    }
}

public struct MetaModel {
    /// 현재 요청 offset
    public var offset: Int
    /// 현재 요청 limit
    public var limit: Int
    /// 마지막 페이지 여부
    public var isFinal: Bool
    
    public init(offset: Int, limit: Int, isFinal: Bool) {
        self.offset = offset
        self.limit = limit
        self.isFinal = isFinal
    }
    
    public mutating func plusOnePage() {
        self.offset += 1
    }
}

