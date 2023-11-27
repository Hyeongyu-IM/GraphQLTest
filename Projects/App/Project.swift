
import ProjectDescriptionHelpers
import ProjectDescription
import ConfigurationPlugin
import EnvironmentPlugin
import DependencyPlugin

// MARK: - Project
let project = Project.makeModule(name: env.name,
                                 targets: [.app, .unitTest],
                                 packages: package,
                                 internalDependencies: [
                                    .data,
                                    .Modules.dsKit,
                                 ]
)
