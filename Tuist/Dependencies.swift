//
//  Dependencies.swift
//  Config
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription
import DependencyPlugin

let dependencies = Dependencies(
        swiftPackageManager: SwiftPackageManagerDependencies(
            [
                .SnapKit,
                .Kingfisher,
                .Then,
                .Apollo,
                .GraphQLAPI,
                .Quick,
                .Nimble
            ],
            productTypes: [
                "GraphQLAPI" : .framework
            ],
            baseSettings: .settings(configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ])
        )
    )
