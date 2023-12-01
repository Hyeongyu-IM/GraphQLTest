// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLAPI

public class Query: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<Product>("product") public var product
    @Field<ProductList>("products") public var products
  }
}

public extension Mock where O == Query {
  convenience init(
    product: Mock<Product>? = nil,
    products: Mock<ProductList>? = nil
  ) {
    self.init()
    _setEntity(product, for: \.product)
    _setEntity(products, for: \.products)
  }
}
