//
//  FeatureTarget.swift
//  ProjectDescriptionHelpers
//
//  Created by 임현규 on 11/28/23.
//

import Foundation
import ProjectDescription

public enum FeatureTarget {
    case app    // iOS App
    case interface      // Feature Interface
    case dynamicFramework
    case staticFramework
    case unitTest   // Unit Test
    
    public var hasFramework: Bool {
        switch self {
        case .dynamicFramework, .staticFramework: return true
        default: return false
        }
    }
    
    public var isDynamicFramework: Bool { return self == .dynamicFramework }
}

