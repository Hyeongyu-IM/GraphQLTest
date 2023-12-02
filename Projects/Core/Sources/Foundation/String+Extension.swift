//
//  String+Extension.swift
//  Core
//
//  Created by 임현규 on 12/1/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    static let graphQLURLString: String = "https://assignment.mobile.mmtalk.kr/graphql"
    static let APIKey: String = "2G8QgQ5RCM"
}

public extension String {
    func strikeThrough(_ textColor: UIColor) -> NSAttributedString {
       let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                     range: NSMakeRange(0, attributeString.length))
        attributeString.addAttributes([.foregroundColor: textColor],
                                      range: NSMakeRange(0, attributeString.length))
       return attributeString
    }
}
