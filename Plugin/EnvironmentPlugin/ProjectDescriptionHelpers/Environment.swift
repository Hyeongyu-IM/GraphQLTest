//
//  Environment.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public extension Project {
    enum Environment {
        public static let appName: String = "mmTalkShopping"
        public static let appVersion: String = "1.0.0"
        public static let bundlePrefix = "com.hyeongyu.mmTalkShopping"
        public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "14.0",
                                                                    devices: [.iphone, .ipad])
        public static let platform = Platform.iOS
    }
}
