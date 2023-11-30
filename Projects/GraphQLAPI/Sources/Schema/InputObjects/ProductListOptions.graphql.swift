// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ProductListOptions: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    offset: Int,
    limit: Int
  ) {
    __data = InputDict([
      "offset": offset,
      "limit": limit
    ])
  }

  /// pagination offset
  public var offset: Int {
    get { __data["offset"] }
    set { __data["offset"] = newValue }
  }

  /// pagination limit (min : 20, max : 100)
  public var limit: Int {
    get { __data["limit"] }
    set { __data["limit"] = newValue }
  }
}
