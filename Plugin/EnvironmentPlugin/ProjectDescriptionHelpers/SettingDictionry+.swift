//
//  SettingDictionry+.swift
//  ConfigurationPlugin
//
//  Created by 임현규 on 11/28/23.
//

import ProjectDescription

public extension SettingsDictionary {
    static let baseSettings: Self = [
        "OTHER_LDFLAGS": "-ObjC"
    ]
    
    func setProvisioning() -> SettingsDictionary {
        merging(["PROVISIONING_PROFILE_SPECIFIER": SettingValue(stringLiteral: "$(APP_PROVISIONING_PROFILE)")])
            .merging(["PROVISIONING_PROFILE": SettingValue(stringLiteral: "$(APP_PROVISIONING_PROFILE)")])
    }
}
