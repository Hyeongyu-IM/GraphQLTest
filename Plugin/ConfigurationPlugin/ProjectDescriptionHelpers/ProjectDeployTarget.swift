//
//  ProjectDeployTarget.swift
//  MyPlugin
//
//  Created by 임현규 on 11/27/23.
//

import Foundation
import ProjectDescription

public enum ProjectDeployTarget: String {
    case Debug = "Debug"
    case Dev = "Develop"
    case Release = "Release"
}

public extension ConfigurationName {
    static var Debug: ConfigurationName { configuration(ProjectDeployTarget.Debug.rawValue) }
    static var Dev: ConfigurationName { configuration(ProjectDeployTarget.Dev.rawValue) }
    static var Release: ConfigurationName { configuration(ProjectDeployTarget.Release.rawValue) }
}
