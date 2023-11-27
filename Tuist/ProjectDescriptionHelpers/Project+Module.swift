//
//  Project+Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 임현규 on 11/28/23.
//

import Foundation
import ConfigurationPlugin
import EnvironmentPlugin
import DependencyPlugin
import ProjectDescription

public extension Project {
    static func makeModule(
        name: String,
        targets: Set<FeatureTarget> = Set([.staticFramework, .unitTest, .demo]),
        packages: [Package] = [],
        internalDependencies: [TargetDependency] = [],  // 모듈간 의존성
        externalDependencies: [TargetDependency] = [],  // 외부 라이브러리 의존성
        interfaceDependencies: [TargetDependency] = [], // Feature Interface 의존성
        dependencies: [TargetDependency] = [],
        hasResources: Bool = false
    ) -> Project {
        
        let configurationName: ConfigurationName = "Develop"
        let hasDynamicFramework = targets.contains(.dynamicFramework)
        let deploymentTarget = Environment.deploymentTarget
        let platform = Environment.platform
        
        let baseSettings: SettingsDictionary = .baseSettings
        
        var projectTargets: [Target] = []
        var schemes: [Scheme] = []
        
        // MARK: - App
        
        if targets.contains(.app) {
            let versionSetting: [String: SettingValue] = [
                "MARKETING_VERSION": SettingValue(stringLiteral: env.appVersion),
                "CURRENT_PROJECT_VERSION": "1"
            ]
            let settings: SettingsDictionary = .appSettings
                .merging(versionSetting)
                .merging(.codeSign)
                .setProvisioning()
            
            let target = Target(
                name: name,
                platform: platform,
                product: .app,
                bundleId: "\(Environment.bundlePrefix)",
                deploymentTarget: deploymentTarget,
                infoPlist: .default,
                sources: ["bbarge/**/*.swift"],
                resources: [
                    .glob(pattern: .relativeToRoot("Projects/Modules/DSKit/Resources/**/*.*")),
                    "bbarge/Reference/**",
                    "bbarge/View/**/*.storyboard",
                    "bbarge/View/**/*.xib"
                    ] ,
                entitlements: "bbarge/\(name).entitlements",
                scripts: [],
                dependencies: [
                    internalDependencies,
                    externalDependencies,
                    [
//                        .package(product: "GoogleSignIn"),
                        .package(product: "LookinServer"),
                        .package(product: "YouTubeiOSPlayerHelper"),
                        .target(name: "NotificationServiceExtension")
                    ]
                ].flatMap { $0 },
                settings: .settings(base: settings,
                                    configurations: XCConfig.defaultConfig,
                                    defaultSettings: .recommended)
            )
            let notificationTarget = Target(
                name: "NotificationServiceExtension",
                platform: platform,
                product: .appExtension,
                bundleId: "\(env.organizationName).\(env.name).NotificationServiceExtension",
                infoPlist: .extendingDefault(with: [
                    "CFBundleDisplayName": "$(PRODUCT_NAME)",
                    "CFBundleShortVersionString": InfoPlist.Value(stringLiteral: env.appVersion),
                    "NSExtension": [
                        "NSExtensionPointIdentifier": "com.apple.usernotifications.service",
                        "NSExtensionPrincipalClass": "$(PRODUCT_MODULE_NAME).NotificationService"
                    ]
                ]),
                sources: "NotificationServiceExtension/**",
                dependencies: [],
                settings: .settings(configurations: XCConfig.extensionConfigurations)
            )
            projectTargets.append(target)
            projectTargets.append(notificationTarget)
        }
        
        // MARK: - Feature Interface
        
        if targets.contains(.interface) {
            let settings = baseSettings
            
            let target = Target(
                name: "\(name)Interface",
                platform: platform,
                product: .framework,
                bundleId: "\(Environment.bundlePrefix).\(name)Interface",
                deploymentTarget: deploymentTarget,
                infoPlist: .default,
                sources: ["Interface/Sources/**/*.swift"],
                dependencies: interfaceDependencies,
                settings: .settings(base: settings, configurations: XCConfig.framework)
            )
            
            projectTargets.append(target)
        }
        
        // MARK: - Framework
        
        if targets.contains(where: { $0.hasFramework }) {
            let deps: [TargetDependency] = targets.contains(.interface)
            ? [.target(name: "\(name)Interface")]
            : []
            let settings = baseSettings
            
            let target = Target(
                name: name,
                platform: platform,
                product: hasDynamicFramework ? .framework : .staticFramework,
                bundleId: "\(Environment.bundlePrefix).\(name)",
                deploymentTarget: deploymentTarget,
                infoPlist: .default,
                sources: ["Sources/**/*.swift"],
                resources: hasResources ? [.glob(pattern: "Resources/**", excluding: [])] : [],
                dependencies: deps + internalDependencies + externalDependencies + dependencies,
                settings: .settings(base: ["CODE_SIGN_ENTITLEMENTS": "",
                                           "OTHER_LDFLAGS" : "-ObjC"],
                                    configurations: [])
            )
            
            projectTargets.append(target)
        }
        
        // MARK: - Feature Executable
        
//        if targets.contains(.demo) {
//            let deps: [TargetDependency] = [.target(name: name)]
//
//            let target = Target(
//                name: "\(name)Demo",
//                platform: platform,
//                product: .app,
//                bundleId: "\(Environment.bundlePrefix).\(name)Demo",
//                deploymentTarget: deploymentTarget,
//                infoPlist: .default,
//                sources: ["Demo/Sources/**/*.swift"],
//                resources: [.glob(pattern: "Demo/Resources/**", excluding: ["Demo/Resources/dummy.txt"])],
//                entitlements: .relativeToRoot("Projects/App/bbarge/bbarge.entitlements"),
//                dependencies: [
//
//                ].compactMap { $0 },
//                settings: .settings(base: baseSettings,
//                                    configurations: XCConfig.demo)
//            )
//
//            projectTargets.append(target)
//        }
        
        // MARK: - Unit Tests
        
        if targets.contains(.unitTest) {
            let deps: [TargetDependency] = [.target(name: name)]
            let bundleSurfix: String = name == "bbarge" ? "test" : "\(name)Tests"
            let target = Target(
                name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "\(Environment.bundlePrefix).\(bundleSurfix)",
                deploymentTarget: deploymentTarget,
                infoPlist: .default,
                sources: ["Tests/Sources/**/*.swift"],
                dependencies: deps +
                    [
                        .SPM.Quick,
                        .SPM.Nimble,
                        .SPM.RxTest,
                        .SPM.RxBlocking
                    ]
                    .compactMap { $0 },
                settings: .settings(base: ["CODE_SIGN_ENTITLEMENTS": "",
                                           "OTHER_LDFLAGS": "-ObjC"],
                                    configurations: [])
            )
            
            projectTargets.append(target)
        }
        
        // MARK: - Schemes
        
        let additionalSchemes = targets.contains(.demo)
        ? [Scheme.makeScheme(target: configurationName, name: name),
           Scheme.makeDemoScheme(target: configurationName, name: name)]
        : [Scheme.makeScheme(target: configurationName, name: name)]
        
        schemes += additionalSchemes
        
        var scheme = targets.contains(.app)
        ? appSchemes
        : schemes
        
//        if name.contains("Demo") {
//            let testAppScheme = Scheme.makeScheme(target: "QA", name: name)
//            scheme.append(testAppScheme)
//        }
        
        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: .settings(configurations: XCConfig.project),
            targets: projectTargets,
            schemes: scheme,
            resourceSynthesizers: [
                .fonts(),
                .assets(),
                .custom(name: "JSON", parser: .json, extensions: ["json"]),
            ]
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)DemoApp"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)DemoApp"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    static func makeDemoAppTestScheme() -> Scheme {
        let targetName = "\(Environment.workspaceName)-Demo"
        return Scheme(
            name: "\(targetName)-Test",
            shared: true,
            buildAction: .buildAction(targets: ["\(targetName)"]),
            testAction: .targets(
                ["\(targetName)Tests"],
                configuration: "Test",
                options: .options(coverage: true, codeCoverageTargets: ["\(targetName)"])
            ),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .debug),
            profileAction: .profileAction(configuration: .debug),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    }
}

extension Project {
    static let appSchemes: [Scheme] = [
        .init(
            name: "test\(env.name)",
            shared: true,
            buildAction: .buildAction(targets: ["\(env.name)"]),
            testAction: .targets(
                ["\(env.name)Tests"],
                configuration: .Debug,
                options: .options(coverage: true, codeCoverageTargets: ["\(env.name)"])
            ),
            runAction: .runAction(configuration: .Debug,
                                  arguments: .init(environment: ["OS_ACTIVITY_MODE": "disable"],
                                                   launchArguments: [.init(name: "-FIRDebugEnabled", isEnabled: true)])),
            archiveAction: .archiveAction(configuration: .Debug),
            profileAction: .profileAction(configuration: .Debug),
            analyzeAction: .analyzeAction(configuration: .Debug)
        ),
        .init(
            name: "\(env.name)",
            shared: true,
            buildAction: .buildAction(targets: ["\(env.name)"]),
            runAction: .runAction(configuration: .QA,
                                  arguments: .init(environment: ["OS_ACTIVITY_MODE": "disable"],
                                                   launchArguments: [.init(name: "-FIRDebugEnabled", isEnabled: true)])),
            archiveAction: .archiveAction(configuration: .Release),
            profileAction: .profileAction(configuration: .QA),
            analyzeAction: .analyzeAction(configuration: .QA)
        )
    ]
}

