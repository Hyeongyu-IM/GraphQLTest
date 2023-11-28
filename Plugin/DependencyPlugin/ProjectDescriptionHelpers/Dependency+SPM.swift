//
//  Dependency+SPM.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/27/23.
//

import Foundation
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    
    static let Quick = TargetDependency.external(name: "Quick")
    static let Nimble = TargetDependency.external(name: "Nimble")
}

public extension Package {
    //MARK: -- UI
    static let SnapKit = Package.remote(url: "https://github.com/SnapKit/SnapKit.git",
                                        requirement: .upToNextMajor(from: "5.6.0"))
    static let Kingfisher = Package.remote(url: "https://github.com/onevcat/Kingfisher.git",
                                           requirement: .upToNextMajor(from: "7.9.1"))
    
    //MARK: -- Util
    static let Then = Package.remote(url: "https://github.com/devxoul/Then.git",
                                     requirement: .upToNextMajor(from: "2.7.0"))
    
    //MARK: -- Test
    static let Quick = Package.remote(url: "https://github.com/Quick/Quick",
                                      requirement: .upToNextMajor(from: "7.3.0"))
    static let Nimble = Package.remote(url: "https://github.com/Quick/Nimble",
                                       requirement: .upToNextMajor(from: "13.0.0"))
}
