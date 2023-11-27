//
//  Dependencies.swift
//  Config
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let dependencies = Dependencies(
        swiftPackageManager: SwiftPackageManagerDependencies(
            [
                .SnapKit,
                .Kingfisher,
                .Then,
                .Quick,
                .Nimble
            ],
            baseSettings: .settings(configurations: [
                .debug(name: .Debug),
                .debug(name: .Dev),
                .release(name: .Release)
            ])
        )
    )
