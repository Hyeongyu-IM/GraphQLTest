//
//  SettingDictionry+.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public extension SettingsDictionary {
    static let baseSettings: Self = [
        "OTHER_LDFLAGS": ["$(inherited)", "-ObjC"]
    ]
    
    static let appSettings: Self = [
        "OTHER_LDFLAGS": ["$(inherited)",
                          "-ObjC"],
        "HEADER_SEARCH_PATHS": ["$(inherited)",
                               "$(SRCROOT)/../../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/CombineCocoa/Sources/Runtime/include",
                                "$(SRCROOT)/../../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/CombineCocoa/Sources/CombineCocoa"]
    ]
    
    func setProvisioning() -> SettingsDictionary {
        merging(["PROVISIONING_PROFILE_SPECIFIER": SettingValue(stringLiteral: "$(APP_PROVISIONING_PROFILE)")])
            .merging(["PROVISIONING_PROFILE": SettingValue(stringLiteral: "$(APP_PROVISIONING_PROFILE)")])
    }
}
