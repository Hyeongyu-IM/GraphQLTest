//
//  InfoPlistValue.swift
//  EnvironmentPlugin
//
//  Created by 임현규 on 11/30/23.
//

import ProjectDescription

public let infoPlistValues: [String: InfoPlist.Value] = [
    "CFBundleName": "마미톡쇼핑몰",
    "UILaunchStoryboardName": "LaunchScreen",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ],
            ]
        ]
    ]
]
