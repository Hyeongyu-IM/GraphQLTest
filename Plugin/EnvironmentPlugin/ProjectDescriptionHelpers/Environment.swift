//
//  Environment.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let appVersion: String
    public let bundlePrefix: String
    public let deploymentTarget: DeploymentTarget
    public let platform: Platform
}

public let env = ProjectEnvironment(
    name: "mmTalkShopping",
    appVersion: "1.0.0",
    bundlePrefix: "com.hyeongyu",
    deploymentTarget: .iOS(targetVersion: "14.0",
                           devices: [.iphone, .ipad]),
    platform: .iOS
)
