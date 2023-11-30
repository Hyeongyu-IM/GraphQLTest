//
//  Project+Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 임현규 on 11/28/23.
//

import Foundation
import EnvironmentPlugin
import DependencyPlugin
import ProjectDescription

public extension Project {
    static func makeModule(
        name: String,
        targets: Set<FeatureTarget> = Set([.staticFramework, .unitTest]),
        packages: [Package] = [],
        internalDependencies: [TargetDependency] = [],  // 모듈간 의존성
        externalDependencies: [TargetDependency] = [],  // 외부 라이브러리 의존성
        interfaceDependencies: [TargetDependency] = [], // Feature Interface 의존성
        dependencies: [TargetDependency] = [],
        hasResources: Bool = false
    ) -> Project {
        
        let deploymentTarget = Environment.deploymentTarget
        let platform = Environment.platform
        let hasDynamicFramework = targets.contains(.dynamicFramework)
        let baseSettings: SettingsDictionary = .baseSettings
        
        var projectTargets: [Target] = []
        var schemes: [Scheme] = []
        
        // MARK: - App
        
        if targets.contains(.app) {
            let versionSetting: [String: SettingValue] = [
                "MARKETING_VERSION": SettingValue(stringLiteral: env.appVersion),
                "CURRENT_PROJECT_VERSION": "1"
            ]
            let settings: SettingsDictionary = .baseSettings
                .merging(versionSetting)
                .merging(.codeSign)
                .setProvisioning()
            
            let target = Target(
                name: name,
                platform: env.platform,
                product: .app,
                bundleId: "\(env.bundlePrefix).\(name)",
                deploymentTarget: env.deploymentTarget,
                infoPlist: .extendingDefault(with: infoPlistValues),
                sources: ["mmTalkShopping/**/*.swift"],
                resources: [
                    "mmTalkShopping/Reference/**"
                    ] ,
                scripts: [],
                dependencies: [
                    internalDependencies,
                    externalDependencies
                ].flatMap { $0 },
                settings: .settings(base: settings,
                                    defaultSettings: .recommended)
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
                platform: env.platform,
                product: hasDynamicFramework ? .framework : .staticFramework,
                bundleId: "\(env.bundlePrefix).\(name)",
                deploymentTarget: env.deploymentTarget,
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
        
        // MARK: - Unit Tests
        
        if targets.contains(.unitTest) {
            let deps: [TargetDependency] = [.target(name: name)]
            let target = Target(
                name: "\(name)Tests",
                platform: env.platform,
                product: .unitTests,
                bundleId: "\(env.bundlePrefix).\(name)Tests",
                deploymentTarget: env.deploymentTarget,
                infoPlist: .default,
                sources: ["Tests/Sources/**/*.swift"],
                dependencies: deps +
                    [
                        .SPM.Quick,
                        .SPM.Nimble
                    ]
                    .compactMap { $0 },
                settings: .settings(base: ["CODE_SIGN_ENTITLEMENTS": ""],
                                    configurations: [])
            )
            
            projectTargets.append(target)
        }
        
        // MARK: - Schemes
        
        let additionalSchemes = [Scheme.makeScheme(target: .debug, name: name)]
        
        schemes += additionalSchemes
        
        var scheme = targets.contains(.app)
        ? appSchemes
        : schemes
    
        
        return Project(
            name: name,
            organizationName: env.bundlePrefix,
            packages: packages,
            targets: projectTargets,
            schemes: scheme,
            resourceSynthesizers: [
                .assets()
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
}

extension Project {
    static let appSchemes: [Scheme] = [
        .init(
            name: "\(env.name)",
            shared: true,
            buildAction: .buildAction(targets: ["\(env.name)"]),
            testAction: .targets(
                ["\(env.name)Tests"],
                configuration: .debug,
                options: .options(coverage: true, codeCoverageTargets: ["\(env.name)"])
            ),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .debug),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    ]
}

