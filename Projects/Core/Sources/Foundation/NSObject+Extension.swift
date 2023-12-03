//
//  NSObject+Extension.swift
//  Core
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

public extension NSObject {
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}
