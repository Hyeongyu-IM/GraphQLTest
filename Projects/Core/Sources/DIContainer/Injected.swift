//
//  Injected.swift
//  Core
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

@propertyWrapper
public class Injected<T> {
    public let wrappedValue: T
    
    public init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}

