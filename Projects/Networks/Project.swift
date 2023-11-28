import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Networks",
    targets: [.staticFramework],
    internalDependencies: [
        .Domain
    ]
)
