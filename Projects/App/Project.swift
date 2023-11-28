
import ProjectDescriptionHelpers
import ProjectDescription
import EnvironmentPlugin
import DependencyPlugin

// MARK: - Project
let project = Project.makeModule(name: env.name,
                                 targets: [.app, .unitTest],
                                 internalDependencies: [
                                    .Data
                                 ]
)
