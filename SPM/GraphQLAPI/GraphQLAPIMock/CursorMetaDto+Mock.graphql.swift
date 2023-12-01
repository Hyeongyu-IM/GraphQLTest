// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLAPI

public class CursorMetaDto: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLAPI.Objects.CursorMetaDto
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<CursorMetaDto>>

  public struct MockFields {
    @Field<Bool>("isFinal") public var isFinal
    @Field<Int>("limit") public var limit
    @Field<Int>("offset") public var offset
  }
}

public extension Mock where O == CursorMetaDto {
  convenience init(
    isFinal: Bool? = nil,
    limit: Int? = nil,
    offset: Int? = nil
  ) {
    self.init()
    _setScalar(isFinal, for: \.isFinal)
    _setScalar(limit, for: \.limit)
    _setScalar(offset, for: \.offset)
  }
}
