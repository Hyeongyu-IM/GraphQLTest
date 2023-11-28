import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLibs",
    targets: [.dynamicFramework],
    internalDependencies: [
        .SPM.Kingfisher,
        .SPM.SnapKit,
        .SPM.Then
    ]
)
