//
//  ProductModel.swift
//  Domain
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

//MARK: Entity -- Product
public struct ProductModel {
    /// 상품ID (Hash) 상품 상세화면 이동시 사용
    public var hash: String
    /// 브랜드명
    public var brand: String?
    /// 상품명
    public var name: String
    /// 판매 가격
    public var sellPrc: Double
    /// 판매 정가
    public var normalPrc: Double 
    /// 할인율
    public var discountRate: Int
    /// 상품 이미지 주소
    public var imgUrl: String?
    /// 리뷰 점수
    public var reviewAvg: Double
    /// 리뷰 수
    public var reviewCount: Int
    /// 태그 Labels (BEST : 베스트, FREE_DELIVERY : 무료배송)
    public var tags: [String]?
    /// 품절 여부
    public var soldOut: Bool
    
    public init(hash: String, brand: String? = nil, name: String, sellPrc: Double, normalPrc: Double, discountRate: Int, imgUrl: String? = nil, reviewAvg: Double, reviewCount: Int, tags: [String]? = nil, soldOut: Bool) {
        self.hash = hash
        self.brand = brand
        self.name = name
        self.sellPrc = sellPrc
        self.normalPrc = normalPrc
        self.discountRate = discountRate
        self.imgUrl = imgUrl
        self.reviewAvg = reviewAvg
        self.reviewCount = reviewCount
        self.tags = tags
        self.soldOut = soldOut
    }
}
