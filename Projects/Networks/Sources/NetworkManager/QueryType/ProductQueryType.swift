//
//  ProductQueryType.swift
//  Networks
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import GraphQLAPI

enum ProductQueryType: QueryType {
    case product(hash: String)
    case ProductList(variable: ProductListOptions)
    
    var sampleData: Data {
        switch self {
        case .product:
            Data(
                """
{
    "data": {
        "product": {
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
        }
    }
}
""".utf8)
        case .ProductList(let variable):
            Data(
                """
{
    "data": {
        "products": {
            "meta": {
                "offset": 0,
                "limit": 20,
                "isFinal": false
            },
            "products": [
                {
                    "hash": "73BC8649785CC47660AE5DC3B802CDA6",
                    "brand": "|베베원|",
                    "name": "무형광 순면 사계절 배냇슈트-신생아",
                    "sellPrc": 50300,
                    "normalPrc": 87900,
                    "discountRate": 42,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202304/06/6e2a71a7b0423bbbe7c97de339082158.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "8A4053DFAC1F6922A81AED8ECAAD4792",
                    "brand": "[마미누리]",
                    "name": "빅사이즈 임산부원피스 긴팔 홈웨어 임부복원피스 임부원피스 임신복 임산부의류 8959",
                    "sellPrc": 46500,
                    "normalPrc": 52000,
                    "discountRate": 10,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/27/a294758f4fe30941d565ab9b24e21e44.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "001FCA6B304504B620C727B498B2D814",
                    "brand": "[마미누리]",
                    "name": "빅사이즈 임산부원피스 ~7XL 홈웨어 임부복원피스 임부원피스 임신복 임산부의류 8960",
                    "sellPrc": 55300,
                    "normalPrc": 62200,
                    "discountRate": 11,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/27/b7ab98964e7155d7343c2b6244c0a6c4.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "1054E41EABF481CAFBC7B532CA0D1DA0",
                    "brand": "[마미누리]",
                    "name": "안감 기모 세일러 지퍼 원피스 빅사이즈 임산부원피스 임부복",
                    "sellPrc": 83200,
                    "normalPrc": 93200,
                    "discountRate": 10,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/24/9ecf9e086236c3cd26fd85d37f88f3c9.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "45B4A8B2D70E7E2625321550A034DF00",
                    "brand": "[마미누리]",
                    "name": "찰랑찰랑 모달 와이드팬츠 임산부바지 요가바지 빅사이즈 이지웨어 트레이닝바지 8962",
                    "sellPrc": 60300,
                    "normalPrc": 67400,
                    "discountRate": 10,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/24/faa0cbb7b5895eb3ee87acdbefdec9c1.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "F8A3288D15F7971765D63A761B5979CC",
                    "brand": "[마미누리]",
                    "name": "신축성 좋은 조거팬츠 임산부바지 요가바지 라운지웨어 빅사이즈 요가팬츠 8961",
                    "sellPrc": 46100,
                    "normalPrc": 51900,
                    "discountRate": 11,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/24/2360c01110a467481ef67cf9564f2dee.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "82767BD68D0DA5C02DF5F04D13F22540",
                    "brand": "|구구Deal|",
                    "name": "200개한정! 크리스마스트리 풀세트 노르딕 북유럽 트리 종합세트 90cm",
                    "sellPrc": 70100,
                    "normalPrc": 457100,
                    "discountRate": 84,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/24/4923f38065f8accb156e563d49dfd80a.png",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [
                        "FREE_DELIVERY"
                    ],
                    "soldOut": false
                },
                {
                    "hash": "42A0872E8BB68AD51FBC39FA6F4568BF",
                    "brand": "|보아르|",
                    "name": "[~11/30공구특가] 아가맘마 멀티 분유 포트 젖병소독기 스팀 살균기 유리 전기 보온 포트기 쪽쪽이 소독",
                    "sellPrc": 314500,
                    "normalPrc": 632900,
                    "discountRate": 50,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202307/17/7867aa04d418e21872965c45b734bdcf.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "BEEB1024D6D782530220E25FF8B80CAA",
                    "brand": "|룸인커머스|",
                    "name": "[구구Deal] LED 가랜드 크리스마스 줄조명 3종",
                    "sellPrc": 36000,
                    "normalPrc": 90500,
                    "discountRate": 60,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/01/ad0f1586e916e90c0daae2c4fe591d5c.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [
                        "FREE_DELIVERY"
                    ],
                    "soldOut": false
                },
                {
                    "hash": "B8B58DC4043E2BCEC02E62D5001EF153",
                    "brand": "|닥터로하스|",
                    "name": "[~12/1특가] 연세 베이비 드롭유산균 아기유산균 비타민D 액상유산균",
                    "sellPrc": 68200,
                    "normalPrc": 81900,
                    "discountRate": 16,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202211/21/f1266231be3892edf40723cab03053f7.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [
                        "FREE_DELIVERY"
                    ],
                    "soldOut": false
                },
                {
                    "hash": "A990CE495C24BB7772FCC56B7A82F1D0",
                    "brand": "|틴티|",
                    "name": "유아버블클렌저 목욕완구 모음",
                    "sellPrc": 45900,
                    "normalPrc": 138200,
                    "discountRate": 66,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/22/3eb4c423819b32e164d045a8f2a6029e.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [
                        "FREE_DELIVERY"
                    ],
                    "soldOut": false
                },
                {
                    "hash": "DFC2075E6B1A0446059832D3F11AEE8F",
                    "brand": "|짐플리키즈|",
                    "name": "유아 슬라임 젤리 목욕놀이 모음",
                    "sellPrc": 63400,
                    "normalPrc": 159400,
                    "discountRate": 60,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/22/676471f71cf7ee8eb8bcef87eabb3e12.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [
                        "FREE_DELIVERY"
                    ],
                    "soldOut": false
                },
                {
                    "hash": "2157B6D660DF50A65047393F125C07AB",
                    "brand": null,
                    "name": "베러비 베이비 멀티 네일 트리머 신생아 아기 손톱깎이",
                    "sellPrc": 84900,
                    "normalPrc": 110900,
                    "discountRate": 23,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/21/b1c5f6020a0f6867806051274e362fa6.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "73C8F3D9D5F5C4CC06277805A95EC0A5",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 야미콘 피딩 스푼 포크 수저케이스 세트",
                    "sellPrc": 45100,
                    "normalPrc": 56200,
                    "discountRate": 19,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/649352f508c4b321a1a21001b7402844.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "32BF90E3BA59CB46B4B0DA77AE1EC208",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 수저케이스",
                    "sellPrc": 32900,
                    "normalPrc": 38300,
                    "discountRate": 14,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/869429354a65d8a188665d6092a29fa0.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "11DF8F230C0CDA8E54F5722607BEE6C5",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 베이비셀프스푼포크",
                    "sellPrc": 15200,
                    "normalPrc": 18600,
                    "discountRate": 18,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/c44141af81de3dafee0bb7fd8f18f495.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "067E1DDD683AC1F3C40F854448EAF2A8",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 베이비스푼포크",
                    "sellPrc": 14100,
                    "normalPrc": 17300,
                    "discountRate": 18,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/037d41404c30c18bda17b2d783c9720f.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "8CF2191BDCF8CD1B8C58E20D6502A774",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 키즈스푼포크",
                    "sellPrc": 11600,
                    "normalPrc": 14100,
                    "discountRate": 17,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/1e3ef990e29a4f37ae5d0b997843e492.png",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "5D498AA1F7978898EF8E9C4F87572D37",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 양손머그컵",
                    "sellPrc": 25100,
                    "normalPrc": 31800,
                    "discountRate": 21,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/b5abe508081a69508cc252e2828c3673.png",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                },
                {
                    "hash": "EC3F02C3F47663F8D884A1C6A8A54FA4",
                    "brand": "|야미콘|",
                    "name": "옥수수로 만든 친환경 Yummy Corn 키즈머그컵",
                    "sellPrc": 23500,
                    "normalPrc": 29700,
                    "discountRate": 20,
                    "imgUrl": "https://static.shop.mmtalk.kr/_data/product/202311/20/fe4bd1bbde984e1f411475c122600ac9.jpg",
                    "reviewAvg": 0,
                    "reviewCount": 0,
                    "tags": [],
                    "soldOut": false
                }
            ]
        }
    }
}
""".utf8)
        }
    }
}
