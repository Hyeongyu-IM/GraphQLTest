import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLibs",
    targets: [.dynamicFramework],
    externalDependencies: [
        .SPM.Kingfisher,
        .SPM.SnapKit,
        .SPM.CombineCocoa,
        .SPM.CombineDataSource,
        .SPM.Then,
        .SPM.Apollo,
        .SPM.GraphQLAPI,
        .SPM.GraphQLAPIMock
    ]
)
