//
//  Dependency+Project.swift
//  DependencyPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public typealias Dep = TargetDependency

extension Dep {
    public struct Modules { }
}

public extension Dep {
    static let Data = Dep.project(target: "Data", path: .Data)
    
    static let Domain = Dep.project(target: "Domain", path: .Domain)
    
    static let Core = Dep.project(target: "Core", path: .Core)
    
    static let Networks = Dep.project(target: "Networks", path: .Networks)
    
    static let ThirdPartyLibs = Dep.project(target: "ThirdPartyLibs", path: .ThirdPartyLibs)
}
