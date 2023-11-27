//
//  PathExtension.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static var app: Self {
        return .relativeToRoot("Projects/App")
    }
    
    static var data: Self {
        return .relativeToRoot("Projects/Data")
    }
    
    static var domain: Self {
        return .relativeToRoot("Projects/Domain")
    }
    
    static var core: Self {
        return .relativeToRoot("Projects/Core")
    }
    
    static var thirdPartyLibs: Self {
        return .relativeToRoot("Projects/ThirdPartyLibs")
    }
}

