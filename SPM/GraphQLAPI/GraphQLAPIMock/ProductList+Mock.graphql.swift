// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLAPI

public class ProductList: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLAPI.Objects.ProductList
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<ProductList>>

  public struct MockFields {
    @Field<CursorMetaDto>("meta") public var meta
    @Field<[Product]>("products") public var products
  }
}

public extension Mock where O == ProductList {
  convenience init(
    meta: Mock<CursorMetaDto>? = nil,
    products: [Mock<Product>]? = nil
  ) {
    self.init()
    _setEntity(meta, for: \.meta)
    _setList(products, for: \.products)
  }
}
