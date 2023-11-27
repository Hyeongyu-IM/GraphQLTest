//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription
import Foundation

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.optional("name", default: "")
private let targetAttribute = Template.Attribute.required("target")

private let template = Template(
    description: "A template for a new module",
    attributes: [
        layerAttribute,
        nameAttribute,
        targetAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/Source.swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
          path: "Projects/\(layerAttribute)/\(nameAttribute)/Tests/\(nameAttribute)Test.swift",
          templatePath: "UnitTest.stencil"
        )
    ]
)

