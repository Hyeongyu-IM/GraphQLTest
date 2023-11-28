//
//  PathExtension.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static var App: Self {
        return .relativeToRoot("Projects/App")
    }
    
    static var Data: Self {
        return .relativeToRoot("Projects/Data")
    }
    
    static var Domain: Self {
        return .relativeToRoot("Projects/Domain")
    }
    
    static var Core: Self {
        return .relativeToRoot("Projects/Core")
    }
    
    static var ThirdPartyLibs: Self {
        return .relativeToRoot("Projects/ThirdPartyLibs")
    }
    
    static var Networks: Self {
        return .relativeToRoot("Projects/Networks")
    }
}

