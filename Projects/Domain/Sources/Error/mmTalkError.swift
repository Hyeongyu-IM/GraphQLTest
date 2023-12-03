//
//  mmTalkError.swift
//  Domain
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation

public enum mmTalkError: Error {
    case networkError
}

extension mmTalkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .networkError:
            return NSLocalizedString("네트워크 오류가 발생했습니다", comment: "networkError")
        }
    }
}
