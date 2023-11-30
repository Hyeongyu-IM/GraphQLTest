// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProductsQuery: GraphQLQuery {
  public static let operationName: String = "Products"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Products($listOptions: ProductListOptions!) { products(listOptions: $listOptions) { __typename meta { __typename offset limit isFinal } products { __typename hash brand name sellPrc normalPrc discountRate imgUrl reviewAvg reviewCount tags soldOut } } }"#
    ))

  public var listOptions: ProductListOptions

  public init(listOptions: ProductListOptions) {
    self.listOptions = listOptions
  }

  public var __variables: Variables? { ["listOptions": listOptions] }

  public struct Data: GraphQLAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: ["listOptions": .variable("listOptions")]),
    ] }

    public var products: Products { __data["products"] }

    /// Products
    ///
    /// Parent Type: `ProductList`
    public struct Products: GraphQLAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLAPI.Objects.ProductList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("meta", Meta.self),
        .field("products", [Product].self),
      ] }

      /// pagination meta 정보
      public var meta: Meta { __data["meta"] }
      /// 상품 목록
      public var products: [Product] { __data["products"] }

      /// Products.Meta
      ///
      /// Parent Type: `CursorMetaDto`
      public struct Meta: GraphQLAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLAPI.Objects.CursorMetaDto }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("offset", Int.self),
          .field("limit", Int.self),
          .field("isFinal", Bool.self),
        ] }

        /// 현재 요청 offset
        public var offset: Int { __data["offset"] }
        /// 현재 요청 limit
        public var limit: Int { __data["limit"] }
        /// 마지막 페이지 여부
        public var isFinal: Bool { __data["isFinal"] }
      }

      /// Products.Product
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
}
