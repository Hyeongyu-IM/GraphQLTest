// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProductQuery: GraphQLQuery {
  public static let operationName: String = "Product"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Product($hash: String!) { product(hash: $hash) { __typename hash brand name sellPrc normalPrc discountRate imgUrl reviewAvg reviewCount tags soldOut } }"#
    ))

  public var hash: String

  public init(hash: String) {
    self.hash = hash
  }

  public var __variables: Variables? { ["hash": hash] }

  public struct Data: GraphQLAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("product", Product.self, arguments: ["hash": .variable("hash")]),
    ] }

    public var product: Product { __data["product"] }

    /// Product
    ///
    /// Parent Type: `Product`
    public struct Product: GraphQLAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLAPI.Objects.Product }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("hash", GraphQLAPI.ID.self),
        .field("brand", String?.self),
        .field("name", String.self),
        .field("sellPrc", Double.self),
        .field("normalPrc", Double.self),
        .field("discountRate", Int.self),
        .field("imgUrl", String?.self),
        .field("reviewAvg", Double.self),
        .field("reviewCount", Int.self),
        .field("tags", [String]?.self),
        .field("soldOut", Bool.self),
      ] }

      /// 상품ID (Hash) 상품 상세화면 이동시 사용
      public var hash: GraphQLAPI.ID { __data["hash"] }
      /// 브랜드명
      public var brand: String? { __data["brand"] }
      /// 상품명
      public var name: String { __data["name"] }
      /// 판매 가격
      public var sellPrc: Double { __data["sellPrc"] }
      /// 판매 정가
      public var normalPrc: Double { __data["normalPrc"] }
      /// 할인율
      public var discountRate: Int { __data["discountRate"] }
      /// 상품 이미지 주소
      public var imgUrl: String? { __data["imgUrl"] }
      /// 리뷰 점수
      public var reviewAvg: Double { __data["reviewAvg"] }
      /// 리뷰 수
      public var reviewCount: Int { __data["reviewCount"] }
      /// 태그 Labels (BEST : 베스트, FREE_DELIVERY : 무료배송)
      public var tags: [String]? { __data["tags"] }
      /// 품절 여부
      public var soldOut: Bool { __data["soldOut"] }
    }
  }
}
