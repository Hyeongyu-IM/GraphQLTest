// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLAPI

public class Product: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLAPI.Objects.Product
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Product>>

  public struct MockFields {
    @Field<String>("brand") public var brand
    @Field<Int>("discountRate") public var discountRate
    @Field<GraphQLAPI.ID>("hash") public var hash
    @Field<String>("imgUrl") public var imgUrl
    @Field<String>("name") public var name
    @Field<Double>("normalPrc") public var normalPrc
    @Field<Double>("reviewAvg") public var reviewAvg
    @Field<Int>("reviewCount") public var reviewCount
    @Field<Double>("sellPrc") public var sellPrc
    @Field<Bool>("soldOut") public var soldOut
    @Field<[String]>("tags") public var tags
  }
}

public extension Mock where O == Product {
  var hash: GraphQLAPI.ID? {
    get { _data["hash"] as? GraphQLAPI.ID }
    set { _setScalar(newValue, for: \.hash) }
  }









  convenience init(
    brand: String? = nil,
    discountRate: Int? = nil,
    hash: GraphQLAPI.ID? = nil,
    imgUrl: String? = nil,
    name: String? = nil,
    normalPrc: Double? = nil,
    reviewAvg: Double? = nil,
    reviewCount: Int? = nil,
    sellPrc: Double? = nil,
    soldOut: Bool? = nil,
    tags: [String]? = nil
  ) {
    self.init()
    _setScalar(brand, for: \.brand)
    _setScalar(discountRate, for: \.discountRate)
    _setScalar(hash, for: \.hash)
    _setScalar(imgUrl, for: \.imgUrl)
    _setScalar(name, for: \.name)
    _setScalar(normalPrc, for: \.normalPrc)
    _setScalar(reviewAvg, for: \.reviewAvg)
    _setScalar(reviewCount, for: \.reviewCount)
    _setScalar(sellPrc, for: \.sellPrc)
    _setScalar(soldOut, for: \.soldOut)
    _setScalarList(tags, for: \.tags)
  }
}
